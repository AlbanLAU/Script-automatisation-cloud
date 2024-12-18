# Met à jour le système et installe Docker
echo "== Mise à jour et installation de Docker =="
sudo apt-get update && sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Ajout de la clé GPG de Docker
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Ajout du dépôt Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installation de Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dpkg --configure -a
# Récupération de l'image depuis Docker Hub
DOCKER_IMAGE="jesperberth/pacman"
echo "== Téléchargement de l'image Docker: $DOCKER_IMAGE =="
docker pull $DOCKER_IMAGE

# Lancement du conteneur
#echo "== Lancement du conteneur =="
docker run -d --name mon_conteneur -p 80:80 $DOCKER_IMAGE

#echo "== Installation et déploiement terminés =="
