
echo "[+] Updating system and installing base packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm gnome-shell gnome-control-center nautilus gdm gnome-text-editor fastfetch alacritty gnome-tweaks

echo "[+] Enabling GDM..."
sudo systemctl enable gdm.service

echo "[+] Cloning repository..."
git clone https://github.com/sergioalanpro/archfiles.git ~/Documents/archfiles

echo "[+] Copying to .icons..."
mkdir -p ~/.icons
cp -r ~/Documents/archfiles/icons/* ~/.icons/

echo "[+] Copying to .config..."
mkdir -p ~/.config
cp -r ~/Documents/archfiles/config/* ~/.config/

echo "[+] Copying wallpaper..."
mkdir -p ~/Pictures
cp ~/Documents/archfiles/wallpapers/wallpaper.png ~/Pictures/

echo "[+] Copying .bashrc..."
cp -f ~/Documents/archfiles/.bashrc ~/.bashrc

echo "[+] Making gitclones folder..."
mkdir -p ~/gitclones && cd ~/gitclones

echo "[+] Installing dependencies for ble.sh..."
sudo pacman -S --noconfirm make gawk

echo "[+] Cloning and installing ble.sh..."
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

echo "[+] ble.sh installed in ~/.local/share/blesh/"

echo "[+] Ready, please reboot..."
