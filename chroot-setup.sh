apk update
apk upgrade --available
apk fix
apk add linux-lts grub-x86_64-efi
swapon /dev/sda2
genfstab -t PARTLABEL / > /etc/fstab
passwd root
useradd lidoryph
passwd lidoryph
usermod -aG wheel lidoryph
echo lidoryph > /etc/hostname
ln -sf ../usr/share/zoneinfo/Europe/Madrid /etc/localtime
dinitctl -o enable gdm
dinitctl -o enable chrony
dinitctl -o enable networkmanager
update-initramfs -c -k all
grub-install --efi-directory=/boot/efi
update-grub
exit
