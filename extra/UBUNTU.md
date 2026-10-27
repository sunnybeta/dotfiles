# Ubuntu

```bash
# Gnome Shell Extensions / Manager
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager
```

```bash
# Command to remove headerbar
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
```

```bash
# Command to remove headerbar
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
```

```bash
# Remove Snap
sudo apt autoremove --purge snapd
sudo apt-mark hold snapd
```

```bash
# Remove .sudo_as_admin_successful
# EDIT /etc/bash.bashrc
```

```bash
# Hide Top Bar Extension
tuxor1337 Hide Top Bar
```

```bash
# Dracula Theme
# Download from https://draculatheme.com/gtk
sudo unzip -d /usr/share/themes gtk-master.zip
sudo mv /usr/share/themes/gtk-master.zip /usr/share/themes/Dracula
sudo unzip -d /usr/share/icons Dracula.zip
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
```

```bash
# Download & install libssl1.1
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```
