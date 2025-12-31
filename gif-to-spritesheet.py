#!/usr/bin/env python3
"""
Converte GIF animado para PNG spritesheet para uso no Phaser
"""

from PIL import Image
import sys
import os

def gif_to_spritesheet(gif_path, output_path=None):
    """
    Converte um GIF animado em um spritesheet PNG horizontal

    Args:
        gif_path: Caminho para o arquivo GIF
        output_path: Caminho para salvar o spritesheet (opcional)

    Returns:
        Dicionário com informações do spritesheet
    """

    # Abrir o GIF
    print(f"[*] Abrindo: {gif_path}")
    gif = Image.open(gif_path)

    # Obter informações do GIF
    frames = []
    frame_count = 0

    try:
        while True:
            # Converter frame para RGBA (suporta transparência)
            frame = gif.convert('RGBA')
            frames.append(frame)
            frame_count += 1
            gif.seek(gif.tell() + 1)
    except EOFError:
        pass  # Fim dos frames

    print(f"[OK] Encontrados {frame_count} frames")

    # Pegar dimensões do primeiro frame
    frame_width, frame_height = frames[0].size
    print(f"[*] Dimensoes de cada frame: {frame_width}x{frame_height}px")

    # Criar spritesheet (todos os frames em uma linha horizontal)
    spritesheet_width = frame_width * frame_count
    spritesheet_height = frame_height

    print(f"[*] Criando spritesheet: {spritesheet_width}x{spritesheet_height}px")

    spritesheet = Image.new('RGBA', (spritesheet_width, spritesheet_height), (0, 0, 0, 0))

    # Colar cada frame no spritesheet
    for i, frame in enumerate(frames):
        x_position = i * frame_width
        spritesheet.paste(frame, (x_position, 0))
        print(f"  -> Frame {i+1}/{frame_count} posicionado em x={x_position}")

    # Determinar caminho de saída
    if output_path is None:
        base_name = os.path.splitext(gif_path)[0]
        output_path = f"{base_name}_spritesheet.png"

    # Salvar spritesheet
    spritesheet.save(output_path, 'PNG')
    print(f"[OK] Spritesheet salvo: {output_path}")

    # Retornar informações
    info = {
        'output_path': output_path,
        'frame_count': frame_count,
        'frame_width': frame_width,
        'frame_height': frame_height,
        'spritesheet_width': spritesheet_width,
        'spritesheet_height': spritesheet_height
    }

    # Mostrar código Phaser
    print("\n" + "="*60)
    print("CODIGO PHASER PARA USAR ESTE SPRITESHEET:")
    print("="*60)

    gif_name = os.path.splitext(os.path.basename(gif_path))[0]

    print(f"""
// No preload() ou em BootScene.js:
this.load.spritesheet('{gif_name}', '{output_path}', {{
    frameWidth: {frame_width},
    frameHeight: {frame_height}
}});

// No create() do LocationScene ou onde criar a animação:
this.anims.create({{
    key: '{gif_name}_anim',
    frames: this.anims.generateFrameNumbers('{gif_name}', {{
        start: 0,
        end: {frame_count - 1}
    }}),
    frameRate: 10,  // Ajuste a velocidade (frames por segundo)
    repeat: -1      // -1 = loop infinito
}});

// Para criar e reproduzir o sprite:
const sprite = this.add.sprite(x, y, '{gif_name}');
sprite.play('{gif_name}_anim');
""")

    print("="*60)

    return info

if __name__ == '__main__':
    # Verificar se foi passado um arquivo
    if len(sys.argv) < 2:
        print("[ERROR] Uso: python gif-to-spritesheet.py <arquivo.gif>")
        print("[INFO] Exemplo: python gif-to-spritesheet.py arvore01.gif")
        sys.exit(1)

    gif_file = sys.argv[1]

    # Verificar se o arquivo existe
    if not os.path.exists(gif_file):
        print(f"[ERROR] Arquivo nao encontrado: {gif_file}")
        sys.exit(1)

    # Converter
    try:
        info = gif_to_spritesheet(gif_file)
        print(f"\n[SUCCESS] CONVERSAO CONCLUIDA COM SUCESSO!")
        print(f"   Frames: {info['frame_count']}")
        print(f"   Frame size: {info['frame_width']}x{info['frame_height']}px")
        print(f"   Spritesheet: {info['spritesheet_width']}x{info['spritesheet_height']}px")
    except Exception as e:
        print(f"[ERROR] Erro ao converter: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
