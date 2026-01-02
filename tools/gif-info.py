#!/usr/bin/env python3
"""
Mostra informações de um GIF (frames, tamanho, etc.)
"""

from PIL import Image
import sys
import os

def get_gif_info(gif_path):
    """Extrai informações de um GIF"""
    try:
        with Image.open(gif_path) as img:
            # Informações básicas
            file_size = os.path.getsize(gif_path)

            # Contar frames
            frame_count = 0
            try:
                while True:
                    img.seek(frame_count)
                    frame_count += 1
            except EOFError:
                pass

            # Voltar ao primeiro frame para pegar info
            img.seek(0)

            width, height = img.size
            mode = img.mode

            # Pegar cor de fundo (primeiro pixel)
            img_rgb = img.convert('RGB')
            bg_color = img_rgb.getpixel((0, 0))

            # Calcular sugestões
            suggested_frames = frame_count
            if frame_count > 20:
                suggested_frames = max(15, frame_count // 2)
            elif frame_count > 30:
                suggested_frames = 20

            return {
                'path': gif_path,
                'file_size': file_size,
                'frames': frame_count,
                'width': width,
                'height': height,
                'mode': mode,
                'bg_color': bg_color,
                'suggested_frames': suggested_frames
            }
    except Exception as e:
        return {'error': str(e)}


def print_gif_info(info):
    """Imprime informações formatadas"""
    if 'error' in info:
        print(f"Erro: {info['error']}")
        return

    print("=" * 70)
    print("INFORMAÇÕES DO GIF")
    print("=" * 70)
    print(f"\nArquivo: {info['path']}")
    print(f"Tamanho: {info['file_size'] / 1024:.2f} KB")
    print(f"\nDimensões: {info['width']}x{info['height']} pixels")
    print(f"Modo de cor: {info['mode']}")
    print(f"Cor de fundo (RGB): {info['bg_color']}")
    print(f"\nTotal de frames: {info['frames']}")
    print(f"Frames sugeridos: {info['suggested_frames']}")

    print("\n" + "=" * 70)
    print("COMANDO SUGERIDO:")
    print("=" * 70)

    basename = os.path.splitext(os.path.basename(info['path']))[0]

    # Sugerir tolerância baseado na cor de fundo
    r, g, b = info['bg_color']
    avg_brightness = (r + g + b) / 3

    if avg_brightness < 50:
        tolerance = 20  # Fundo escuro
    elif avg_brightness > 200:
        tolerance = 15  # Fundo claro
    else:
        tolerance = 20  # Fundo médio

    print(f"\nPowerShell (Windows):")
    print(f"  .\\tools\\gif-to-atlas-complete.ps1 {info['path']} {basename} {info['suggested_frames']} {tolerance}")

    print(f"\nBash (Linux/Git Bash):")
    print(f"  ./tools/gif-to-atlas-complete.sh {info['path']} {basename} {info['suggested_frames']} {tolerance}")

    print("\n" + "=" * 70)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("=" * 70)
        print("GIF INFO - Informações de arquivo GIF")
        print("=" * 70)
        print("\nUso: python tools/gif-info.py <arquivo.gif>")
        print("\nExemplo:")
        print("  python tools/gif-info.py images/objects/bat.gif")
        print("\nMostra:")
        print("  - Número de frames")
        print("  - Tamanho do arquivo")
        print("  - Dimensões")
        print("  - Cor de fundo")
        print("  - Comando sugerido para conversão")
        print("=" * 70)
        sys.exit(1)

    gif_path = sys.argv[1]

    if not os.path.exists(gif_path):
        print(f"Erro: Arquivo '{gif_path}' não encontrado!")
        sys.exit(1)

    info = get_gif_info(gif_path)
    print_gif_info(info)
