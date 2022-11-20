#!/bin/bash
echo "Criando as imagens ....."

docker build -t danilo/projeto-backend:1.0 backend/.
docker build -t danilo/projeto-database:1.0 database/.

echo "Realizando push das imagens ...."

docker push danilo/projeto-backend:1.0
docker push danilo/projeto-database:1.0

echo "Criando serviços do kubernets..."

kubctl apply -f ./services.yml

echo "Criando os deployments ......"

kubctl apply -f ./deployments.yml

