import requests
import os

def download_latest_playit_linux_amd64():
    """
    Descarga la última versión de playit-linux-amd64 desde GitHub Releases.
    """
    repo_owner = "playit-cloud"
    repo_name = "playit-agent"
    api_url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/releases/latest"
    asset_name = "playit-linux-amd64"

    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Lanza una excepción para errores de HTTP
        latest_release_data = response.json()

        download_url = None
        for asset in latest_release_data.get("assets", []):
            if asset.get("name") == asset_name:
                download_url = asset.get("browser_download_url")
                break

        if download_url:
            print(f"Encontrado: {asset_name}. Descargando desde: {download_url}")
            local_filename = os.path.join(os.getcwd(), asset_name)
            with requests.get(download_url, stream=True) as r:
                r.raise_for_status()
                with open(local_filename, 'wb') as f:
                    for chunk in r.iter_content(chunk_size=8192):
                        f.write(chunk)
            print(f"Descarga completa. Archivo guardado como: {local_filename}")
        else:
            print(f"No se encontró el activo '{asset_name}' en la última versión.")

    except requests.exceptions.RequestException as e:
        print(f"Error al conectar con la API de GitHub o al descargar el archivo: {e}")
    except Exception as e:
        print(f"Ocurrió un error inesperado: {e}")

if __name__ == "__main__":
    download_latest_playit_linux_amd64()
