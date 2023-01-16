#!/bin/bash

local IMAGE_NAME=aws
local CONTAINER_NAME=aws
local CONTAINER_VOLUME_NAME=aws
local CREDENTIALS_SECRET_ID=credentials
local CREDENTIALS_SECRET_SRC=./config/credentials
local CONFIG_SECRET_ID=config
local CONFIG_SECRET_SRC=./config/config

echo "Removing previous image, container and volume configuration..."

{
  docker container stop $CONTAINER_NAME 
  docker container rm $CONTAINER_NAME
  docker volume rm $CONTAINER_VOLUME_NAME
  docker image rm $IMAGE_NAME
} 2> /dev/null

echo "Building stuff..."

docker image build \
  --secret id=$CREDENTIALS_SECRET_ID,src=$CREDENTIALS_SECRET_SRC \
  --secret id=$CONFIG_SECRET_ID,src=$CONFIG_SECRET_SRC \
  --tag $IMAGE_NAME \
  . 

docker container run \
  -it -d \
  --name $CONTAINER_NAME \
  --volume $CONTAINER_VOLUME_NAME:/root \
  $IMAGE_NAME 

clear 

docker container exec -it $CONTAINER_NAME /bin/bash 
