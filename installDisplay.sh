#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING Display OpenBox"
echo

PKGS=(
            ## Xorg Packages
            'xorg-server'             ##Xorg X server {Display_Server}
            'xorg-xbacklight'         ##RandR-based backlight control application
            'xorg-fonts-misc'         ##X.org misc fonts
            'xorg-xfd'                ##Displays all the characters in a font using either the X11 core protocol or libXft2
            'xorg-xkill'              ##Kill a client by its X resource
            'xorg-xrandr'             ##Primitive command line interface to RandR extension
            'xorg-xrdb'               ##X server resource database utility
            'xorg-xset'               ##User preference utility for X   

            ## Touchpad and Mouse
            'xorg-xinput'             ##Small commandline tool to configure devices
            'xf86-input-libinput'     ##Generic input driver for the X.Org server based on libinput

            ## GPU Drivers (Intel/AMD/VM)
            'xf86-video-fbdev'        ##X.org framebuffer video driver
            'xf86-video-vesa'         ##X.org vesa video driver
            'xf86-video-intel'        ##X.org Intel i810/i830/i915/945G/G965+ video drivers
            'xf86-video-amdgpu'       ##X.org amdgpu video driver
            'xf86-video-ati'          ##X.org ati video driver

            ## GPU Drivers (Nvidia)
            'xf86-video-nouveau'      ##Open Source 3D acceleration driver for nVidia cards
            'nvidia'                  ##NVIDIA drivers for linux
            'nvidia-utils'            ##NVIDIA drivers utilities
            'nvidia-settings'         ##Tool for configuring the NVIDIA graphics driver

            ## Openbox
            'obconf'                  ##A GTK+ based configuration tool for the Openbox windowmanager
            'openbox'  

            ## DisplayManager
            'lxdm-gtk3'               ##Lightweight X11 Display Manager (GTK+ 3 version)
            ### Execution Time need Terminal you can remove it later
            'xterm'                  ## Openbox needed Terminal
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

## configuring lxdm.conf file
echo "configuring lxdm.conf file ........."

echo "session=/usr/bin/openbox-session" >> /etc/lxdm/lxdm.conf
echo "lxdm.service is starting....."
sudo systemctl enable lxdm.service

echo
echo "Done!"
echo

sudo reboot now
