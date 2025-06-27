# **makedown** (makeup upside down)
## Uniform theming solution for Linux desktop systems

![Nordic](doc/img/Nordic.png)
*Example: Nordic theme applied consistently across GTK and Qt applications*

A comprehensive theme management script that provides a unified theming experience across different desktop environments and applications on Linux systems.

## Features

**makedown** supports theming for:
- **GNOME desktop environment**
- **GTK 3 applications**
- **GTK 4 applications** 
- **Qt 5 applications**
- **Qt 6 applications**
- **Flatpak GTK 3 applications**
- **Flatpak GTK 4 applications**

**makedown** main features:
- **Automatic theme detection and mapping**
- **Interactive theme selection via GUI**
- **Command-line interface for automation**

## Recommended Themes
- Nordic [(GTK)](https://github.com/EliverLara/Nordic) | [(KDE)](https://github.com/EliverLara/Nordic/tree/master/Kvantum)
- Colloid [(GTK)](https://github.com/vinceliuice/Colloid-gtk-theme) | [(KDE)](https://github.com/vinceliuice/Colloid-kde)
- Dracula [(GTK)](https://github.com/dracula/gtk) | [(KDE)](https://github.com/dracula/kvantum)
- WhiteSur [(GTK)](https://github.com/vinceliuice/WhiteSur-gtk-theme) | [(KDE)](https://github.com/vinceliuice/WhiteSur-kde)

## Prerequisites

### Required Dependencies
- `zenity` - For GUI dialogs
- `gsettings` - For GNOME theme configuration
- `kvantummanager` - For Qt theme management
- `stylepak` - For Flatpak theme generation (optional)

### Flatpak Configuration
To achieve uniform theming for Flatpak applications, you need to create filesystem overrides:

```bash
sudo flatpak override --filesystem=xdg-config/gtk-3.0
sudo flatpak override --filesystem=xdg-config/gtk-4.0
sudo flatpak override --filesystem=$HOME/.themes
```

### Stylepak Setup
If your desired theme doesn't have a Flatpak pack, **makedown** can create GTK3 packs on-the-fly using stylepak:

1. Download stylepak from: https://github.com/refi64/stylepak
2. Install it somewhere in your `$PATH`
3. **makedown** will automatically use it when needed

### Qt Theme Configuration

**makedown** uses Kvantum for Qt application theming. After installing `kvantummanager`, add these lines to your shell profile (`.profile`, `.bashrc`, or `.zshrc`):

```bash
export QT_QPA_PLATFORMTHEME=kvantum
export QT_STYLE_OVERRIDE=kvantum
```

## Installation

### Method 1: Manual Installation
1. Copy the `makedown` script to any directory in your `$PATH` (e.g., `/usr/local/bin/` or `~/bin/`)
2. Make it executable: `chmod +x makedown`
3. Optionally, modify the `THEMES_DIR` and `CONFIG_DIR` variables in the script if you use custom locations

### Method 2: Local Installation
```bash
# Clone or download the repository
git clone <repository-url>
cd makedown

# Copy to local bin directory
mkdir -p ~/bin
cp bin/makedown ~/bin/
chmod +x ~/bin/makedown

# Add ~/bin to PATH if not already present
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Usage

### Interactive Mode (Recommended)
Launch the GUI theme selector:
```bash
makedown
```

This will:
1. Show a dialog to select from available GTK themes
2. Automatically filter and show matching Kvantum themes if exists
3. Apply all theme settings across the system

### Command Line Mode
If you know exactly which themes to apply:
```bash
makedown THEME_NAME [KVANTUM_THEME_NAME]
```

Examples:
```bash
makedown "Yaru"
makedown "WhiteSur-Light" "WhiteSur"
makedown "Colloid-Light" "Colloid"
```

### Automatic Theme Mapping
**makedown** includes automatic theme mapping for popular themes:
- `Colloid-Light` → `Colloid` (Kvantum)
- `WhiteSur-Light` → `WhiteSur` (Kvantum)
- `Yaru` → `KvYaru` (Kvantum)

## Theme Management

### Supported Theme Locations
- **User themes**: `~/.themes/`
- **System themes**: `/usr/share/themes/`
- **User Kvantum themes**: `~/.config/Kvantum/`
- **System Kvantum themes**: `/usr/share/Kvantum/`

### Creating Custom Themes
The main limitation of modern desktop theming is that GTK4 has limited theming support compared to GTK3. We recommend:

1. **Start with a GTK4-compatible theme** that also supports GTK3
2. **Copy the theme** to your `~/.themes/` directory
3. **Find or create a matching Kvantum theme** and place it in `~/.config/Kvantum/`
4. **Use makedown** to apply the theme consistently across all applications

### Theme Structure
A complete theme should include:
```
~/.themes/YourTheme/
├── gtk-3.0/
│   ├── gtk.css
│   └── gtk-dark.css
├── gtk-4.0/
│   ├── gtk.css
│   └── gtk-dark.css
├── gnome-shell/
│   └── gnome-shell.css
└── assets/
    └── (theme assets)

~/.config/Kvantum/YourKvantumTheme/
├── YourKvantumTheme.kvconfig
└── YourKvantumTheme.svg
```

## Troubleshooting

### Common Issues
- **Theme not applying**: Try logging out and back in, or restart the session with `Alt+F2` → `r`
- **Flatpak apps not themed**: Ensure flatpak overrides are set correctly
- **Qt apps not themed**: Verify Kvantum environment variables are set
- **GNOME Shell theme not working**: Install and enable the User Themes extension

### Manual Session Restart
Some theme changes require a session restart. You can:
1. Log out and log back in
2. Restart GNOME Shell: `Alt+F2` → type `r` → Enter

## Contributing

Feel free to contribute by:
- Adding support for more theme mappings
- Improving error handling
- Adding support for additional desktop environments
- Reporting bugs or suggesting features

## License

This project is open source. Please check the license file for details.

