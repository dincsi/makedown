#!/bin/bash

# Ellenőrizzük, hogy megadtak-e bemenő paramétert
if [ $# -eq 0 ]; then
    echo "USage: $0 <paraméter>"
    exit 1
fi

THEME_NAME="$1"
HOME_DIR="$HOME"
THEMES_DIR="$HOME_DIR/.themes"
CONFIG_DIR="$HOME_DIR/.config"



# GNOME Théme beállítása
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"
gsettings set org.gnome.desktop.wm.preferences theme "$THEME_NAME"  

# GNOME Shell Théme beállítása
gsettings set org.gnome.shell.extensions.user-theme name "$THEME_NAME"

# GTK3 Théme beállítása
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"

#removing old symlinks
rm -rf $CONFIG_DIR/gtk-4.0/gtk.css
rm -rf $CONFIG_DIR/gtk-4.0/gtk-dark.css
rm -rf $CONFIG_DIR/gtk-4.0/assets

mkdir -p $CONFIG_DIR/gtk-4.0
mkdir -p $CONFIG_DIR/gtk-4.0/assets

ln -s $THEMES_DIR/$THEME_NAME/gtk-4.0/gtk.css $CONFIG_DIR/gtk-4.0/gtk.css
ln -s $THEMES_DIR/$THEME_NAME/gtk-4.0/gtk-dark.css $CONFIG_DIR/gtk-4.0/gtk-dark.css
ln -s $THEMES_DIR/$THEME_NAME/assets $CONFIG_DIR/gtk-4.0/assets

## Flatpak override for themes
## Needs root privileges but this can be run once

# flatpak override --filesystem=xdg-config/gtk-3.0 && flatpak override --filesystem=xdg-config/gtk-4.0
# flatpak override --filesystem=$THEMES_DIR

# Flatpak GTK3 Théme beállítása
# If there is no downloadable theme flatpak will user the default
# We create and install a pack of the currently used theme by using stylepak
# download: 

stylepak install-user 

#nevek összepárosítása
KVANTUM_THEME_NAME=$THEME_NAME

# if theme_name is Colloid-ligh then set the Kvanum theme name to Colloid
if [ "$THEME_NAME" == "Colloid-Light" ]; then
    KVANTUM_THEME_NAME="Colloid"
fi

if [ "$THEME_NAME" == "WhiteSur-Light" ]; then
    KVANTUM_THEME_NAME="WhiteSur"
fi

if [ "$THEME_NAME" == "Yaru-blue" ]; then
    KVANTUM_THEME_NAME="KvYaru-blue"
fi

# kvantum téma beállítása
kvantummanager --set $KVANTUM_THEME_NAME

