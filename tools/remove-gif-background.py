from PIL import Image
import sys

def remover_fundo_gif(input_path, output_path, threshold=10):
    """
    Remove o fundo de um GIF animado, processando cada frame.

    Args:
        input_path: Caminho do GIF de entrada
        output_path: Caminho do GIF de saída (com transparência)
        threshold: Tolerância para cores similares ao fundo (padrão: 10)
    """
    try:
        # Abrir o GIF
        gif = Image.open(input_path)
    except FileNotFoundError:
        print(f"Erro: Arquivo '{input_path}' não encontrado.")
        return
    except Exception as e:
        print(f"Erro ao abrir GIF: {e}")
        return

    # Informações do GIF
    try:
        num_frames = gif.n_frames
    except AttributeError:
        print("Erro: Não é um GIF animado.")
        return

    print(f"GIF com {num_frames} frames")
    print(f"Tamanho: {gif.size}")

    # Lista para armazenar os frames processados
    frames_processados = []

    # Detectar cor de fundo do primeiro frame (canto superior esquerdo)
    gif.seek(0)
    primeiro_frame = gif.convert("RGBA")
    bg_color = primeiro_frame.getpixel((0, 0))[:3]  # RGB apenas

    print(f"Cor de fundo detectada (R,G,B): {bg_color}")
    print("Processando frames...")

    # Processar cada frame
    for frame_num in range(num_frames):
        gif.seek(frame_num)

        # Converter frame para RGBA
        frame = gif.convert("RGBA")
        width, height = frame.size

        # Processar pixels do frame
        pixels = frame.load()

        for y in range(height):
            for x in range(width):
                r, g, b, a = pixels[x, y]

                # Verificar se o pixel é similar ao fundo
                diff_r = abs(r - bg_color[0])
                diff_g = abs(g - bg_color[1])
                diff_b = abs(b - bg_color[2])

                if diff_r <= threshold and diff_g <= threshold and diff_b <= threshold:
                    # Tornar transparente
                    pixels[x, y] = (r, g, b, 0)

        frames_processados.append(frame)

        # Mostrar progresso
        if (frame_num + 1) % 10 == 0 or frame_num == num_frames - 1:
            print(f"  Processados {frame_num + 1}/{num_frames} frames...")

    print("\nSalvando GIF com transparência...")

    # Salvar como GIF animado com transparência
    try:
        # Configurações do GIF original
        duration = gif.info.get('duration', 100)  # Duração padrão 100ms se não especificada

        frames_processados[0].save(
            output_path,
            save_all=True,
            append_images=frames_processados[1:],
            duration=duration,
            loop=0,
            transparency=0,
            disposal=2,  # Clear frame before rendering next
            optimize=False  # Não otimizar para preservar qualidade
        )

        print(f"Sucesso! GIF salvo em '{output_path}'")

        # Mostrar tamanhos
        import os
        tamanho_original = os.path.getsize(input_path) / 1024
        tamanho_novo = os.path.getsize(output_path) / 1024
        print(f"\nTamanho original: {tamanho_original:.2f} KB")
        print(f"Tamanho novo: {tamanho_novo:.2f} KB")

    except Exception as e:
        print(f"Erro ao salvar GIF: {e}")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("=" * 70)
        print("REMOVER FUNDO DE GIF ANIMADO")
        print("=" * 70)
        print("\nUso: python remove-gif-background.py <entrada.gif> <saida.gif> [tolerancia]")
        print("\nExemplos:")
        print("  python remove-gif-background.py spider.gif spider_no_bg.gif")
        print("  python remove-gif-background.py spider.gif spider_no_bg.gif 15")
        print("\nParâmetros:")
        print("  entrada.gif : GIF animado de entrada")
        print("  saida.gif   : GIF animado de saída (com transparência)")
        print("  tolerancia  : Tolerância de cor 0-255 (padrão: 10)")
        print("                Aumente se o fundo não estiver sendo removido")
        print("=" * 70)
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]

        tolerancia = 10
        if len(sys.argv) > 3:
            try:
                tolerancia = int(sys.argv[3])
            except ValueError:
                print(f"Aviso: Tolerância '{sys.argv[3]}' inválida. Usando padrão.")

        print(f"\n{'='*70}")
        print(f"Processando: {input_file}")
        print(f"Tolerância: {tolerancia}")
        print(f"{'='*70}\n")

        remover_fundo_gif(input_file, output_file, tolerancia)
