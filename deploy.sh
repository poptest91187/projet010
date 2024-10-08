#!/bin/bash
mvn clean install
# Nom de l'image Docker
IMAGE_NAME="mon-app"
# Nom du conteneur Docker
CONTAINER_NAME="mon-app"
# Chemin du répertoire contenant le Dockerfile
DOCKERFILE_PATH="/path/to/your/app"
# Port d'exposition du conteneur
HOST_PORT=8080
CONTAINER_PORT=8080

# Étape 1: Vérifier et supprimer l'image Docker existante
if docker images | grep -q $IMAGE_NAME; then
    echo "L'image Docker $IMAGE_NAME existe déjà. Suppression en cours..."
    docker rmi -f $IMAGE_NAME
    echo "Image supprimée avec succès."
else
    echo "L'image $IMAGE_NAME n'existe pas. Pas besoin de la supprimer."
fi

# Étape 2: Construire une nouvelle image Docker à partir du Dockerfile
echo "Construction de la nouvelle image Docker $IMAGE_NAME..."
docker build -t $IMAGE_NAME  .
if [ $? -eq 0 ]; then
    echo "Image construite avec succès."
else
    echo "Erreur lors de la construction de l'image Docker."
    exit 1
fi

# Étape 3: Arrêter et supprimer le conteneur Docker existant s'il existe
if docker ps -a | grep -q $CONTAINER_NAME; then
    echo "Le conteneur $CONTAINER_NAME existe déjà. Arrêt et suppression en cours..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    echo "Conteneur supprimé avec succès."
else
    echo "Aucun conteneur nommé $CONTAINER_NAME trouvé. Pas besoin de supprimer."
fi

# Étape 4: Démarrer un nouveau conteneur à partir de l'image
echo "Démarrage du nouveau conteneur $CONTAINER_NAME..."
docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $IMAGE_NAME
if [ $? -eq 0 ]; then
    echo "Conteneur démarré avec succès. Accessible sur le port $HOST_PORT."
else
    echo "Erreur lors du démarrage du conteneur."
    exit 1
fi
