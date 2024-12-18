sudo apt-get update && \
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
sudo apt-get update && \
sudo apt-get install -y docker-ce && \
sudo systemctl enable docker && \
sudo systemctl start docker && \

# Récupération de l'image depuis Docker Hub
DOCKER_IMAGE="jesperberth/pacman" && \
docker pull $DOCKER_IMAGE && \

# Lancement du conteneur
docker run -d --name mon_conteneur -p 80:80 $DOCKER_IMAGE && \

# Confirmation de l'installation et du déploiement
echo "== Installation et déploiement terminés =="
