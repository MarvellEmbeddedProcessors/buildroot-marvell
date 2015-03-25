#!/bin/sh

export CROSS_COMPILE=output/host/usr/bin/aarch64-linux-gnu-
./board/marvell/scripts/mkimage -O linux -T ramdisk -A arm64 -C none -n "Ramdisk" -d $1/rootfs.ext2 $1/u_rootfs.ext2
echo -n "bin2hex..."
./board/marvell/scripts/bin2phex.pl -i $1/u_rootfs.ext2 -o $1/u_rootfs_ext2.hex -b 0x1080000
echo "Done."
