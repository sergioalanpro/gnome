
echo "[+] Updating system and installing base packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm gnome-shell gnome-control-center nautilus gdm gnome-text-editor fastfetch alacritty gnome-tweaks

echo "[+] Enabling GDM..."
sudo systemctl enable gdm.service

echo "[+] Copying to .icons..."
mkdir -p ~/.icons
cp -r icons/* ~/.icons/

echo "[+] Copying to .config..."
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "[+] Copying wallpaper..."
mkdir -p ~/Pictures
cp wallpapers/* ~/Pictures/

echo "[+] Copying .bashrc..."
cp -f .bashrc ~/.bashrc

echo "[+] Making ~/gitclones folder..."
mkdir -p ~/Downloads/gitclones && cd ~/Downloads/gitclones

echo "[+] Installing dependencies for ble.sh..."
sudo pacman -S --noconfirm make gawk

echo "[+] Cloning and installing ble.sh..."
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

echo "[+] ble.sh installed in ~/.local/share/blesh/"

echo "[✅] Setup complete! You can now reboot to apply all changes."
