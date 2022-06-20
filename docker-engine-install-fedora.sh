#### https://docs.docker.com/engine/install/fedora/ 

sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
sudo docker run hello-world

#
#
#
#

sudo dnf -y install docker-compose

sudo wget https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')/contrib/completion/bash/docker-compose -O /etc/bash_completion.d/docker-compose

#FILE: docker-compose.yml
#
#version: '2'
#
#services:
#  urbackup:
#    image: uroni/urbackup-server:latest
#    container_name: urbackup
#    restart: unless-stopped
#    environment:
#      - PUID=1000 # Enter the UID of the user who should own the files here
#      - PGID=1000 # Enter the GID of the user who should own the files here
#      - TZ=America/Chicago # Enter your timezone
#    volumes:
#      - /home/crisb/storage:/var/urbackup
#      - /home/crisb/data:/backups
#      # Uncomment the next line if you want to bind-mount the www-folder
#      #- /path/to/wwwfolder:/usr/share/urbackup
#    network_mode: "host"
#    # Activate the following two lines for BTRFS support
#    cap_add:
#      - SYS_ADMIN

sudo docker-compose up 
