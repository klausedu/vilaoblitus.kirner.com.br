from PIL import Image
import sys
import os

def extract_gif_frames(gif_path, output_dir, max_frames=20):
    """
    Extrai frames de um GIF e salva como PNGs individuais.
    Renderiza cada frame completamente (resolve frames delta).
    """
    try:
        gif = Image.open(gif_path)
    except Exception as e:
        print(f"Erro ao abrir GIF: {e}")
        return []

    # Criar diretório de saída
    os.makedirs(output_dir, exist_ok=True)

    try:
        num_frames = gif.n_frames
    except AttributeError:
        print("Não é um GIF animado.")
        return []

    print(f"GIF com {num_frames} frames")

    # Calcular step para reduzir frames
    step = max(1, num_frames // max_frames)
    selected_indices = list(range(0, num_frames, step))[:max_frames]

    print(f"Extraindo {len(selected_indices)} frames (1 a cada {step})...")

    frame_paths = []

    for i, frame_idx in enumerate(selected_indices):
        gif.seek(frame_idx)

        # Converter para RGBA (garante que frame está completo)
        frame = gif.convert('RGBA')

        # Salvar frame
        output_path = os.path.join(output_dir, f'frame_{i:04d}.png')
        frame.save(output_path, 'PNG')
        frame_paths.append(output_path)

        if (i + 1) % 5 == 0:
            print(f"  Extraídos {i + 1}/{len(selected_indices)} frames...")

    print(f"\nCompleto! {len(frame_paths)} frames salvos em '{output_dir}'")
    return frame_paths


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python gif-to-frames.py <gif> [max_frames]")
        print("Exemplo: python gif-to-frames.py spider.gif 20")
    else:
        gif_file = sys.argv[1]
        max_frames = int(sys.argv[2]) if len(sys.argv) > 2 else 20

        basename = os.path.splitext(os.path.basename(gif_file))[0]
        output_dir = f"frames_{basename}"

        extract_gif_frames(gif_file, output_dir, max_frames)
