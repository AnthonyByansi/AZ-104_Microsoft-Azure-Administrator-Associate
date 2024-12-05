from azure.storage.blob import BlobServiceClient

# Replace with your Azure Storage account connection string
CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=<account_name>;AccountKey=<account_key>;EndpointSuffix=core.windows.net"
CONTAINER_NAME = "mycontainer"
BLOB_NAME = "example.txt"
LOCAL_FILE_PATH = "example.txt"

def upload_blob():
    try:
        # Create the BlobServiceClient object
        blob_service_client = BlobServiceClient.from_connection_string(CONNECTION_STRING)

        # Get a client for the container
        container_client = blob_service_client.get_container_client(CONTAINER_NAME)

        # Upload the file
        with open(LOCAL_FILE_PATH, "rb") as data:
            blob_client = container_client.get_blob_client(BLOB_NAME)
            blob_client.upload_blob(data, overwrite=True)

        print(f"Blob '{BLOB_NAME}' uploaded successfully to container '{CONTAINER_NAME}'.")

    except Exception as ex:
        print(f"An error occurred: {ex}")

if __name__ == "__main__":
    upload_blob()
