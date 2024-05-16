from google.cloud import storage

projet_id = "bucket-project-410808"

def create_bucket(bucket_name, project_name):
    # Initialise le client Google Cloud Storage avec les informations d'authentification
    client = storage.Client(project=project_name)

    # Crée un nouveau Bucket
    try:
        bucket = client.create_bucket(bucket_name)
        print(f"Le Bucket '{bucket.name}' a été créé avec succès.")
    except Exception as e:
        print(f"Une erreur s'est produite : {e}")

# create_bucket(f'{projet_id}-test', projet_id)

def upload_image(bucket_name, local_image_path, destination_blob_name, project_id):
    # Initialise le client Google Cloud Storage avec les informations d'authentification et le projet
    client = storage.Client(project=project_id)

    # Obtenez le bucket dans lequel vous souhaitez téléverser le fichier
    bucket = client.get_bucket(bucket_name)

    # Chemin local de l'image que vous souhaitez téléverser
    blob = bucket.blob(destination_blob_name)

    # Téléversement de l'image dans le bucket
    try:
        blob.upload_from_filename(local_image_path)
        print(f"L'image {local_image_path} a été téléversée dans '{bucket_name}/{destination_blob_name}' avec succès.")
        blob.make_public()
    except Exception as e:
        print(f"Une erreur s'est produite : {e}")

for i in range(5):
    upload_image(f'{projet_id}-test', 'Ok.jpg', f'photodefou{i+1}.jpg', projet_id)

def delete_image(bucket_name, image_name, project_id):

    # Initialise le client Google Cloud Storage avec les informations d'authentification et le projet
    client = storage.Client(project=project_id)

    # Obtenez le bucket dans lequel se trouve le fichier à supprimer
    bucket = client.get_bucket(bucket_name)

    # Suppression du fichier du bucket
    try:
        blob = bucket.blob(image_name)
        blob.delete()
        print(f"L'image '{image_name}' a été supprimée avec succès du bucket '{bucket_name}'.")
    except Exception as e:
        print(f"Une erreur s'est produite : {e}")

# delete_image(f'{projet_id}-test', 'photodefou.jpg', projet_id)