#!/bin/sh

export CROSS_COMPILE=output/host/usr/bin/aarch64-linux-gnu-
for f in `ls output/images/rootfs.ext*`; do
	./board/marvell/scripts/mkimage -O linux -T ramdisk -A arm64 -C none -n "Ramdisk" -d $f $(dirname $f)/u_$(basename $f)
done
echo -n "bin2hex..."
./board/marvell/scripts/bin2phex.pl -i $1/u_rootfs.ext2 -o $1/u_rootfs_ext2.hex -b 0x3000000
echo "Done."
