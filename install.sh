# INITIAL SETUP #

#--- You're Welcome You ---#
exit

#--- partition ---#
echo "NAME        MAJ:MIN RM TYPE MOUNTPOINTS
nvme0n1     259:0    0 disk 
├─nvme0n1p1 259:1    0 vfat /mnt/boot/efi
├─nvme0n1p2 259:2    0 swap [SWAP]
├─nvme0n1p3 259:3    0 ext4 /mnt
│                           /
└─nvme0n1p4 259:4    0 ext4 /mnt/home"

#--- mount ---#
echo "Enter Drive Prefix: "
read $prefix
mkdir /dev/'$prefix'3 /mnt
mkdir -p /mnt/boot/efi
mkdir -p /mnt/home
mount /dev/'$prefix'1 /mnt/boot/efi
mount /dev/'$prefix'4 /mnt/home
mkfs.vfat /dev/'$prefix'1
mkswap /dev/'$prefix'2
swapon /dev/'$prefix'2
mkfs.ext4 /dev/'$prefix'3
mkfs.ext4 /dev/'$prefix'4

#--- basestrap ---#

basestrap /mnt base base-devel linux linux-firmware artix-archlinux-support neovim elogind-openrc efibootmgr

#--- fstab ---#
fstabgen -U /mnt > /mnt/etc/fstab

#--- chroooooooooooooooot ---"
artix-chroot /mnt

#--- update /etc/pacman.conf ---#
echo "Add the following lines: "
echo "
[multilib]
Include = /etc/pacman.d/mirrorlist-arch

[extra]
Include = /etc/pacman.d/mirrorlist-arch
" >> /etc/pacman.conf
 
#--- packages ---#
pacman -S amd-ucode bluez-utils brightnessctl btop docker-openrc fastfetch feh figlet firefox hyprshot gimp git glow grub hyprland hyprlock hyprpaper kitty mpc mpd mpv ncmpcpp networkmanager networkmanager-openrc ntfs-3g nvidia-settings openssh-openrc pipewire-openrc rtkit steam stow tailscale-openrc ufw unzip waybar wl-clipboard yazi tree grub dkms less cmake pipewire-pulse man lm_sensors

#--- gpu ---#
pacman -S libva-utils libva-nvidia-driver nvidia-open-dkms mesa-utils nvidia-settings nvidia-utils lib32-mesa lib32-nvidia-utils lib32-vulkan-radeon libva-mesa-driver lib32-vulkan-icd-loader libva-intel-driver libva-utils

#--- completion ---#
sudo pacman -S --needed --noconfirm linux-headers
# sudo dkms autoinstall # optional
sudo mkinitcpio -P
sudo dkms status

#--- root ---$
echo "Enter Root Password"
passwd

#--- time ---#
ln -sf /usr/share/zoneinfo/Asia/Dubai /etc/localtime
 
#--- host ---#
echo "luci4" > /etc/hostname
 
#--- new user ---#
echo "Enter Username: "
read $user
useradd -m -G wheel $user
echo "Enter Password: "
passwd $user

#--- dotfiles ---#
cd /home/$user
mkdir .config .local
echo "--- Dotfiles ---"
echo "Enter Org: "
read org
echo "Enter Repo: "
read repo
git clone https://github.com/$org/$repo
cd $repo
stow .
rm .bash_login
rm .bash_profile
cd /

#--- sudoers ---#
echo "Updating Sudoers"
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers

#--- grub ---#
grub-install --target=x64_64-efi --efi-directory=/boot/efi --bootloader=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#--- restart ---#
echo "Restarting Sudoers"
reboot
