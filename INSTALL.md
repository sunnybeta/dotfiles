# Arch Linux

# Time Sync
```bash
hwclock --systohc
```

# Update Locale
```bash
# uncomment en_US.UTF-8 in /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
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
useradd -m -G wheel username
passwd username
passwd root
```

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

# Installation

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
