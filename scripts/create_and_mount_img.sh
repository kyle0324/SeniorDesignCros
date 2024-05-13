#!/bin/bash

disk_img=ramfs.img
# mnt_point=~/.cros/root
mnt_point=$1
disk_img_loc=$(dirname $mnt_point)

$disk_img_loc
# #Parses mnt_point to get correct dir for disk_img
# IFS='/' read -ra ADDR <<< "$mnt_point"
# for i in "${ADDR[@]}"; do
#     if [ ! $i = "root" ]; then
#         disk_img_loc+=$i'/'
#     fi
# done


#Create .img if it does not exist
if [ ! -f $disk_img_loc/$disk_img ]; then
    dd if=/dev/zero of=$disk_img bs=1M count=8
    mkfs.vfat -F32 -n "CROS__RAMFS" $disk_img
    mkdir -p $disk_img_loc
    mv $disk_img $disk_img_loc
    echo "Created CROS ramfs.img"
else
    echo "Cros ramfs.img already exists"
fi

#Create loop device at next open loop device slot if one doesnt exist
ld_check=$(losetup -j $disk_img_loc/$disk_img | awk '{sub(/:/,"",$1); print $1}')

if [[ $ld_check = "" ]]; then
    ld=$(losetup -f)
    sudo losetup $ld $disk_img_loc/$disk_img
    echo "Created loop device targeting ramfs.img"
else
    echo "Loop device alread exists"
fi

#Delete all files in mnt point for clean build
#FIXME
if [ -f $disk_img_loc ]; then
    rm -r $mnt_point
fi
mkdir -p $mnt_point

#Mount img file if it is not already mounted
mnt_check=$(findmnt --mountpoint $mnt_point)

if [[ $mnt_check = "" ]]; then
    sudo mount -o loop,rw,uid=$UID $ld $mnt_point
    echo "Mounting loop device"
else
    echo "Loop device already mounted"
fi
