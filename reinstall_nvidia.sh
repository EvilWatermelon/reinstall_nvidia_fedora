#!/bin/sh

################################################
# NVIDIA driver versions are not up-to-date with
# the current patches from fedora.
# If you installed the newest version of the NVIDIA 
# driver and have issues with the monitor resolution etc.,
# then reinstall the NVIDIA driver with this script.
#
# @OS: Fedora 37
# @author: Jan
# @date: 10/04/2023
# @version: 0.0.1
#################################################

echo '###############################################'
echo 'Script to reinstall NVIDIA driver for Fedora 37'
echo '###############################################'
set -e

sudo dnf upgrade -y

echo 'Deleting NVIDIA driver...'
sudo dnf autoremove nvidia*

echo 'Add repo...'
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora37/x86_64/cuda-fedora37.repo

echo 'Reinstall neccessary packages...'
sudo dnf install kernel-headers kernel-devel tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-devel acpid pkgconfig dkms

sudo dnf install libglvnd-glx

echo 'Install NVIDIA driver...'
sudo dnf module install nvidia-driver:latest-dkms

echo 'EOF'
