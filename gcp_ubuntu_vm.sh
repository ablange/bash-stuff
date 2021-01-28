#
#        Configure Ubuntu Desktop on GCP
#		 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Dependencies:
#     (1) Google Cloud Platform account & project
#     (2) VNCServer Client - https://www.realvnc.com/en/connect/download/viewer/
#

# Install gcloud
cd ~/repos/
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-325.0.0-darwin-x86_64.tar.gz;
tar -xf google-cloud-sdk-325.0.0-darwin-x86_64.tar.gz;
rm google-cloud-sdk-325.0.0-darwin-x86_64.tar.gz;
./google-cloud-sdk/install.sh;
./google-cloud-sdk/bin/gcloud init;
gcloud components install alpha;
gcloud components install beta;

# Set context
gcloud config set run/region us-central1;
gcloud config set core/project andrewblange;

# Create Ubuntu VM
gcloud beta compute instances create andrewblange-workspace \
    --project=andrewblange \
    --zone=us-central1-a \
    --machine-type=e2-medium \
    --subnet=default \
    --network-tier=PREMIUM 
    --maintenance-policy=MIGRATE 
    --service-account=700881912045-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --image=ubuntu-1604-xenial-v20210119 \
    --image-project=ubuntu-os-cloud \
    --boot-disk-size=30GB \
    --boot-disk-type=pd-ssd \
    --boot-disk-device-name=instance-name \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --reservation-affinity=any;

# Install dependencies
sudo apt-get update;
sudo apt-get upgrade;
sudo apt-get install gnome-shell;
sudo apt-get install ubuntu-gnome-desktop;
sudo apt-get install autocutsel;
sudo apt-get install gnome-core;
sudo apt-get install gnome-panel;
sudo apt-get install gnome-themes-standard;

# Install VNC Server
sudo apt-get install tightvncserver;
touch ~/.Xresources;

# Launch VNC Server (create password if first time)
tightvncserver

# Edit VNC startup script
vim /home/andrew_lange93/.vnc/xstartup;
"""
#!/bin/sh
autocutsel -fork
xrdb $HOME/.Xresources
xsetroot -solid grey
export XKL_XMODMAP_DISABLE=1
export XDG_CURRENT_DESKTOP="GNOME-Flashback:Unity"
export XDG_MENU_PREFIX="gnome-flashback-"
unset DBUS_SESSION_BUS_ADDRESS
gnome-session --session=gnome-flashback-metacity --disable-acceleration-check --debug &
"""

# Restart server to persist changes
vncserver -kill :1;
vncserver -geometry 1024x640;

# SSH into VM
gcloud compute ssh andrewblange-workspace \
    --project andrewblange \
    --zone us-central1-a \
    --ssh-flag "-L 5901:localhost:5901"

# Launch VNC Viewer
# Enter URL: localhost:5901
# Enter password that was previously created by tightvncserver
