# Artix Linux

1. download iso from official website
2. Burn image to a pen drive

```bash
dd if= of= status=progress bs=4M
```

3. boot into drive

artix
artix

# Become Root

```bash
su
cd
```

# Partition

```bash
fdisk /dev/sda
# create and modify partitions with
# d: delete
# n: new
# p: print
# w: write
mkfs.ext4 /dev/sdx
mkswap /dev/sdy && swapon /dev/sdy
```

# Internet

```bash
kill $(pidof wpa_supplicant)
rfkill unblock all
ip link set wlan0 up
wpa_passphrase "router name" > pass
dhclient
```

```bash
# Base Install
mount /dev/sdx /mnt
basestrap /mnt base base-devel linux linux-firmware runit elogind-runit
fstabgen /mnt > /mnt/etc/fstab
# Chroot
artix-chroot /mnt
```

# Internet and Editor
```bash
pacman -S wpa_supplicant dhclient vi grub
```

# Time Sync
```bash
hwclock --systohc
```

# Update Locale
```bash
# uncomment en_US.UTF-8 in /etc/locale.conf
locale-gen
```

# Zone
```bash
ln -sf /usr/share/zone/ocntinent/region /etc/localtime
```

# Hostname
```bash
echo hostname > /etc/hostname
```

# User

```bash
groupadd username
useradd -m -g username username
```

# Grab the Pass File

# Update Sudoers /etc/sudoers

```bash
%uername ALL=(ALL:ALL) ALL
```

# Boot

```bash
grub install --target=i386-pc /dev/sdx
grub-mkconfig -o /boot/grub/grub.cfg
```

# Bye Bye

```bash
exit
cp pass /mnt/home/username
umount -R /mnt
reboot
```

# Login
```
username
password
```

```
Update /etc/pacman.conf
```

# Installation

```bash
sudo pacman -Sy
sudo pacman -S artix-archlinux-support i3-gaps i3blocks feh figlet git zathura-pdf-poppler ncmpcpp mpd mpc mpv xf86-video-intel xf86-video-vesa xf86-video-fbdev xf86-video-amd mesa firefox rxvt-unicode alsa-utils cmake neofetch acpi htop unclutter xorg-xrandr xorg-xsetroot xorg-xinit xorg-server pavucontrol npm openssh tmux maim
```

# Unmute Audio Sources

```bash
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute
```

# Neovim

```bash
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

# Dotfiles

```bash
cd
mkdir .config
git clone https://github.com/sunnybeta/dotfiles
cd dotfiles
cp .bashrc $HOME/.bashrc
rm $HOME/.bash_profile
cp .profile $HOME/.profile
```
# Wallpaper

```
git clone https://github.com/sunnybeta/wallpapers
cp wallpapers/alien.jpg .config/wallpaper/img
```
