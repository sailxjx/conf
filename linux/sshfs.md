# Mount
sshfs dev:/home/xujingxin /Users/xujingxin/Remote/dev


# Unmount

pkill -kill -f "sshfs" & umount /Users/xujingxin/Remote/dev
