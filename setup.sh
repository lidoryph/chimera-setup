echo THE PASSWORD IS chimera
doas apk add git
echo THE PASSWORD IS chimera
doas wipefs -a /dev/sda
doas sfdisk /dev/sda <<EOF
label: gpt
name=esp, size=100M, type="EFI System"
name=swap, size=8G, type"Linux Swap"
name=root
EOF
doas mkfs.vfat /dev/sda1
doas mkswap /dev/sda2
doas mkfs.ext4 /dev/sda3
doas mkdir /media/root
doas mount /dev/sda3
doas mkdir -p /media/root/boot/efi
doas mount /dev/sda1 /media/root/boot/efi
doas chmod 755 /media/root
doas chimera-bootstrap -l /media/root
git clone https://github.com/lidoryph/chimera-setup
cd chimera-setup
doas cp chroot-setup.sh /media/root
chimera-chroot /media/root
doas rm /media/root/chroot-setup.sh
cd ..
doas rm -rf chimera-setup
exit
reboot
