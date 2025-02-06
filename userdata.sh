#!/bin/bash

# Recebe o endpoint do banco de dados como variável
DB_ENDPOINT=${db_endpoint}

sudo su

cd /home/ec2-user

# Atualiza e instala dependências
sudo yum update -y
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user

# Instala o Docker Compose
sudo curl -SL https://github.com/docker/compose/releases/download/v2.32.4/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configura o NFS para o EFS
sudo yum install -y nfs-utils
sudo mkdir -p /mnt/efs/wordpress
sudo chmod -R 777 /mnt/efs
echo "${efs_dns}:/ /mnt/efs nfs defaults,_netdev 0 0" | sudo tee -a /etc/fstab
sudo mount -a

# Cria o arquivo docker-compose.yaml com o endpoint do banco de dados
cat <<EOL > /home/ec2-user/docker-compose.yaml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    container_name: wordpress
    restart: always
    volumes:
      - /mnt/efs/wordpress:/var/www/html  # Monta os arquivos do WordPress no EFS
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: "${db_endpoint}"
      WORDPRESS_DB_USER: "admin"
      WORDPRESS_DB_PASSWORD: "admin123"
      WORDPRESS_DB_NAME: "wordpressdb"
    
EOL

# Inicia o WordPress com Docker Compose
docker-compose -f /home/ec2-user/docker-compose.yaml up -d