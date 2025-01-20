echo THE PASSWORD IS chimera
apk add git
echo THE PASSWORD IS chimera
su -
wipefs -a /dev/sda
sfdisk /dev/sda <<EOF
label: gpt
name=esp, size=100M, type="EFI System"
name=swap, size=8G, type"Linux Swap"
name=root
EOF
mkfs.vfat /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mkdir /media/root
mount /dev/sda3
mkdir -p /media/root/boot/efi
mount /dev/sda1 /media/root/boot/efi
chmod 755 /media/root
chimera-bootstrap -l /media/root
git clone https://github.com/lidoryph/chimera-setup
cd chimera-setup
cp chroot-setup.sh /media/root
chimera-chroot /media/root
rm /media/root/chroot-setup.sh
cd ..
rm -rf chimera-setup
exit
reboot
