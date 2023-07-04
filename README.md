# learning-docker

Creates the docker image: docker-compose up -d | docker-compose up -d --build

Stopping the docker image: docker-compose down

Images status: docker-compose ps

If the image Exited or crashed, see the log: docker-compose -f logs <container_name>
                                             docker-compose logs <service_name>

To enter container : docker exec -u 0 -it <container_name> bash (or bin/bash)

Running Containers: docker container ls

All Containers: docker container ls -a

All Images: docker images | docker image ls

Remove Container: docker rm <container_name>

Remove Image: docker rmi --force <image_name>