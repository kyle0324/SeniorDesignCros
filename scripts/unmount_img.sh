#!/bin/bash

disk_img=ramfs.img
#Makefile deaults to '~/.cros' as argument
mnt_point=$1
# mnt_point="$(HOME)/.cros/root"
disk_img_loc=$(dirname $mnt_point)

if [ $mnt_point != ~/.cros/root ]; then #Saftey Check
    echo "This script will delete all files in $disk_img_loc. Are you sure you want to proceed? (y/n)"

    while true; do
    read -s -n 1 key

    case $key in
        y|Y)
        echo "Proceeding..."
        break
        ;;

        n|N)
        echo "Operation canceled."
        exit 0
        ;;
        *)
        echo "Invalid input. Please press 'y' or 'n'."
        ;;
        esac
    done
fi

mnt_check=$(findmnt --mountpoint $mnt_point)

if [[ ! $mnt_check = "" ]]; then
    sudo umount $mnt_point
    echo "Unmounted CROS_FS"
else
    echo "CROS_FS not mounted"
fi

ld=$(losetup -j $disk_img_loc/$disk_img | awk '{sub(/:/,"",$1); print $1}')

if [[ ! $ld = "" ]]; then
    sudo losetup -d $ld
    echo "Deleted loop device"
else
    echo "No loop device to delete"
fi

if [ -f  $disk_img_loc/$disk_img ]; then
    rm -r $disk_img_loc
    echo "Deleting $disk_img_loc"
else
    echo 'No dir to delete'
fi
