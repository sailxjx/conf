mount /dev/sda3 /mnt/gentoo/
mount /dev/sda1 /mnt/gentoo/boot/
mount -t proc none /mnt/gentoo/proc
mount -o bind /dev /mnt/gentoo/dev