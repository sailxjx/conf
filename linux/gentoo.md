mount /dev/sda3 /mnt/gentoo/
mount /dev/sda1 /mnt/gentoo/boot/
mount -t proc none /mnt/gentoo/proc
mount -o bind /dev /mnt/gentoo/dev

emerge XXX
emerge -C XXX  #卸载
emerge -p XXX  #查看软件依赖包
equery d XXX  #查看哪些软件依赖XXX

修改欢迎词 /etc/motd
