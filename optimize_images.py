import os
from PIL import Image
import shutil

# Configuration
IMAGE_DIR = 'c:/src/codex.oblitus/images'
BACKUP_DIR = 'c:/src/codex.oblitus/images_backup'
MAX_WIDTH = 1920
MAX_HEIGHT = 1080
QUALITY = 80
MIN_SIZE_KB = 500  # Only optimize files larger than 500KB

def optimize_images():
    # Create backup directory
    if not os.path.exists(BACKUP_DIR):
        os.makedirs(BACKUP_DIR)
        print(f"Created backup directory: {BACKUP_DIR}")

    # Walk through directory
    for root, dirs, files in os.walk(IMAGE_DIR):
        # Skip backup dir itself if it's inside (it isn't based on path, but good practice)
        if 'images_backup' in root:
            continue

        for file in files:
            if file.lower().endswith(('.jpg', '.jpeg', '.png')):
                file_path = os.path.join(root, file)
                file_size_kb = os.path.getsize(file_path) / 1024

                # Check if optimization is needed
                if file_size_kb > MIN_SIZE_KB:
                    print(f"Optimizing: {file} ({file_size_kb:.2f} KB)...")
                    
                    # Backup
                    rel_path = os.path.relpath(root, IMAGE_DIR)
                    backup_subdir = os.path.join(BACKUP_DIR, rel_path)
                    if not os.path.exists(backup_subdir):
                        os.makedirs(backup_subdir)
                    
                    shutil.copy2(file_path, os.path.join(backup_subdir, file))

                    # Optimize
                    try:
                        with Image.open(file_path) as img:
                            # Convert to RGB if needed (e.g. RGBA pngs saving as jpg, or just for consistency)
                            if img.mode in ('RGBA', 'P') and file.lower().endswith('.jpg'):
                                img = img.convert('RGB')
                            
                            # Resize if too big
                            width, height = img.size
                            if width > MAX_WIDTH or height > MAX_HEIGHT:
                                img.thumbnail((MAX_WIDTH, MAX_HEIGHT), Image.Resampling.LANCZOS)
                                print(f"  Resized from {width}x{height} to {img.size[0]}x{img.size[1]}")
                            
                            # Save
                            img.save(file_path, optimize=True, quality=QUALITY)
                            
                            new_size_kb = os.path.getsize(file_path) / 1024
                            saved_kb = file_size_kb - new_size_kb
                            print(f"  Done! New size: {new_size_kb:.2f} KB (Saved {saved_kb:.2f} KB)")

                    except Exception as e:
                        print(f"  Error optimizing {file}: {e}")

if __name__ == "__main__":
    optimize_images()
