from http.server import BaseHTTPRequestHandler, HTTPServer
from google.cloud import storage

projet_id = "bucket-project-410808"

def list_images(bucket_name):
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blobs = bucket.list_blobs()

    # Récupérer les URL complètes des images dans le bucket
    image_urls = [f"https://storage.googleapis.com/{bucket_name}/{blob.name}" for blob in blobs if blob.name.lower().endswith(('.jpg', '.jpeg', '.png'))]

    return image_urls

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

        html_content = f'''
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Liste des Images</title>
        </head>
        <body>
            <h1>Liste des Images</h1>
            <div id="image-list">
                {"".join([f"<img src='{image_url}' width='300' height='300' />" for image_url in list_images(f'{projet_id}-test')])}
            </div>
        </body>
        </html>
        '''

        self.wfile.write(html_content.encode('utf-8'))

def run_server():
    server_address = ('', 8000)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    print('Serveur démarré sur le port 8000...')
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()