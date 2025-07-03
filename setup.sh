
echo "[+] Actualizando sistema e instalando paquetes base..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm gnome-shell gnome-control-center nautilus gdm gnome-text-editor fastfetch

echo "[+] Habilitando GDM..."
sudo systemctl enable gdm.service
sudo systemctl start gdm.service

echo "[+] Clonando repositorio de configuración..."
git clone https://github.com/sergioalanpro/archfiles.git ~/Documents/archfiles

echo "[+] Instalando temas de íconos..."
mkdir -p ~/.icons
cp -r ~/Documents/archfiles/icons/* ~/.icons/

echo "[+] Copiando configuración de fastfetch y alacritty..."
mkdir -p ~/.config
cp -r ~/Documents/archfiles/config/* ~/.config/

echo "[+] Copiando wallpaper..."
mkdir -p ~/Pictures
cp ~/Documents/archfiles/wallpapers/wallpaper.png ~/Pictures/

echo "[+] Listo. Puedes aplicar tu tema o fondo desde GNOME o vía comandos."

echo "[+] Copiando archivo .bashrc..."
cp -f ~/Documents/archfiles/.bashrc ~/.bashrc


echo "[+] Haciendo carpeta gitclones"
mkdir -p ~/gitclones && cd ~/gitclones

echo "[+] Instalando dependencias para ble.sh..."
sudo pacman -S --noconfirm make gawk

echo "[+] Clonando e instalando ble.sh..."
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

echo "[+] ble.sh instalado en ~/.local/share/blesh/"

echo "[+] Listo..."
