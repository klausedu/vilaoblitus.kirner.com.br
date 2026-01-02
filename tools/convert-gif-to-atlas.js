const fs = require('fs');
const { GifUtil, GifFrame, BitmapImage } = require('gifwrap');
const { PNG } = require('pngjs');

async function convertGifToAtlas(gifPath, outputName, maxFrames = 20) {
    console.log(`Reading ${gifPath}...`);

    // Read the GIF
    const gif = await GifUtil.read(gifPath);
    const allFrames = gif.frames;

    console.log(`Found ${allFrames.length} frames total`);
    console.log(`Frame size: ${allFrames[0].bitmap.width}x${allFrames[0].bitmap.height}`);

    // Render all frames first (handle GIF disposal methods)
    console.log('Rendering frames with proper composition...');
    const renderedFrames = [];
    const canvasWidth = allFrames[0].bitmap.width;
    const canvasHeight = allFrames[0].bitmap.height;

    // Create a canvas to compose frames
    const canvas = Buffer.alloc(canvasWidth * canvasHeight * 4);
    canvas.fill(0); // Start with transparent

    for (let i = 0; i < allFrames.length; i++) {
        const frame = allFrames[i];

        // Handle disposal method from previous frame
        if (i > 0) {
            const prevDisposal = allFrames[i - 1].disposalMethod;
            if (prevDisposal === 2) {
                // Restore to background (clear)
                canvas.fill(0);
            }
            // disposalMethod 0 or 1: keep previous frame (do nothing)
        }

        // Composite current frame onto canvas
        const srcBitmap = frame.bitmap;
        for (let y = 0; y < srcBitmap.height; y++) {
            for (let x = 0; x < srcBitmap.width; x++) {
                const srcIdx = (y * srcBitmap.width + x) * 4;
                const dstIdx = (y * canvasWidth + x) * 4;

                const alpha = srcBitmap.data[srcIdx + 3];
                if (alpha > 0) {
                    // Copy pixel
                    canvas[dstIdx] = srcBitmap.data[srcIdx];
                    canvas[dstIdx + 1] = srcBitmap.data[srcIdx + 1];
                    canvas[dstIdx + 2] = srcBitmap.data[srcIdx + 2];
                    canvas[dstIdx + 3] = srcBitmap.data[srcIdx + 3];
                }
            }
        }

        // Save a copy of the rendered frame
        const frameCopy = new BitmapImage(canvasWidth, canvasHeight);
        frameCopy.data = Buffer.from(canvas);
        renderedFrames.push(frameCopy);
    }

    // Sample frames to reduce to maxFrames
    const step = Math.ceil(renderedFrames.length / maxFrames);
    const frames = [];
    for (let i = 0; i < renderedFrames.length; i += step) {
        frames.push({ bitmap: renderedFrames[i] });
    }

    console.log(`Reduced to ${frames.length} frames (1 every ${step} frames)`);

    // Calculate optimal grid layout
    const frameWidth = frames[0].bitmap.width;
    const frameHeight = frames[0].bitmap.height;
    const cols = Math.ceil(Math.sqrt(frames.length));
    const rows = Math.ceil(frames.length / cols);

    console.log(`Creating atlas with ${cols} columns x ${rows} rows`);

    const atlasWidth = cols * frameWidth;
    const atlasHeight = rows * frameHeight;

    // Create PNG atlas
    const png = new PNG({
        width: atlasWidth,
        height: atlasHeight,
        filterType: -1
    });

    // Fill with transparent pixels
    png.data.fill(0);

    // Create JSON metadata
    const atlasData = {
        frames: {},
        meta: {
            image: `${outputName}_atlas.png`,
            size: { w: atlasWidth, h: atlasHeight },
            scale: "1"
        }
    };

    // Copy each frame to the atlas
    frames.forEach((frame, index) => {
        const bitmap = frame.bitmap;
        const col = index % cols;
        const row = Math.floor(index / cols);
        const x = col * frameWidth;
        const y = row * frameHeight;

        // Copy frame pixels to atlas
        for (let py = 0; py < frameHeight; py++) {
            for (let px = 0; px < frameWidth; px++) {
                const srcIdx = (py * frameWidth + px) * 4;
                const dstIdx = ((y + py) * atlasWidth + (x + px)) * 4;

                png.data[dstIdx] = bitmap.data[srcIdx];       // R
                png.data[dstIdx + 1] = bitmap.data[srcIdx + 1]; // G
                png.data[dstIdx + 2] = bitmap.data[srcIdx + 2]; // B
                png.data[dstIdx + 3] = bitmap.data[srcIdx + 3]; // A
            }
        }

        // Add frame metadata
        atlasData.frames[`${outputName}_${index}`] = {
            frame: { x, y, w: frameWidth, h: frameHeight },
            rotated: false,
            trimmed: false,
            spriteSourceSize: { x: 0, y: 0, w: frameWidth, h: frameHeight },
            sourceSize: { w: frameWidth, h: frameHeight }
        };
    });

    // Save PNG
    const pngPath = `images/objects/${outputName}_atlas.png`;
    await new Promise((resolve, reject) => {
        png.pack()
            .pipe(fs.createWriteStream(pngPath))
            .on('finish', resolve)
            .on('error', reject);
    });

    console.log(`Atlas saved to ${pngPath}`);
    console.log(`Atlas size: ${atlasWidth}x${atlasHeight}`);

    // Save JSON
    const jsonPath = `images/objects/${outputName}_atlas.json`;
    fs.writeFileSync(jsonPath, JSON.stringify(atlasData, null, 2));
    console.log(`JSON saved to ${jsonPath}`);

    // Get file sizes
    const gifSize = fs.statSync(gifPath).size;
    const pngSize = fs.statSync(pngPath).size;
    const jsonSize = fs.statSync(jsonPath).size;

    console.log(`\nFile sizes:`);
    console.log(`  GIF:  ${(gifSize / 1024).toFixed(2)} KB`);
    console.log(`  PNG:  ${(pngSize / 1024).toFixed(2)} KB`);
    console.log(`  JSON: ${(jsonSize / 1024).toFixed(2)} KB`);
    console.log(`  Total: ${((pngSize + jsonSize) / 1024).toFixed(2)} KB`);

    return {
        frames: frames.length,
        atlasSize: `${atlasWidth}x${atlasHeight}`,
        cols,
        rows
    };
}

// Convert spider without background with max 20 frames
convertGifToAtlas('images/objects/spider_no_bg.gif', 'spider', 20)
    .then(result => {
        console.log(`\nConversion complete!`);
        console.log(`Frames: ${result.frames}`);
        console.log(`Grid: ${result.cols}x${result.rows}`);
    })
    .catch(err => {
        console.error('Error:', err);
    });
