My Linux Dotfiles

My personal Linux desktop configuration, built around Hyprland, Waybar, Quickshell, Rofi, SwayNC, Fish, Kitty, and Matugen.

The setup is heavily inspired by macOS, Material You, and Fluent Design, with a focus on rounded UI, dynamic colors, smooth animations, and a clean desktop.

Still a work in progress. Things will probably break. That's part of the experience.


Features

- Hyprland - Wayland compositor and window management
- Waybar - Status bar
- Quickshell - Custom desktop UI and Dynamic Island-style components
- Rofi - Application launcher, clipboard, wallpaper picker, and power menu
- SwayNC - Notification center
- Fish - Shell configuration and custom prompt
- Kitty - Terminal configuration
- Matugen - Dynamic Material You color generation
- Dynamic colors shared across multiple applications
- Custom keybinds, animations, window rules, and desktop behavior


Desktop

WM: Hyprland
Shell: Fish
Terminal: Kitty
Launcher: Rofi
Bar: Waybar
Notifications: SwayNC
Theming: Matugen
UI: Quickshell


Design

The visual style is mainly inspired by:

- macOS
- Material You
- Microsoft Fluent Design

The goal is a desktop that feels minimal, soft, responsive, and slightly playful, rather than just throwing blur everywhere because Linux apparently requires 47 layers of transparency to function.

The setup uses rounded surfaces, dynamic colors, smooth transitions, and consistent typography across applications.


Structure

config/
├── fish/
├── hypr/
├── kitty/
├── matugen/
├── rofi/
├── swaync/
└── waybar/


Hyprland

Contains the main Hyprland configuration and separated modules for:

- animations
- autostart
- decoration
- environment variables
- input
- layouts
- monitors
- window rules
- keybinds


Matugen

Contains templates used to generate colors for different applications.

matugen/templates/
├── colors.css
├── gtk-colors.css
├── hyprland-colors.conf
├── kitty-colors.conf
├── quickshell.json
├── rofi-colors.rasi
├── rofi.rasi
├── swaync.css
├── vscode-colors
└── ...


Rofi

Includes:

- application launcher
- clipboard launcher
- wallpaper picker
- power menu
- custom themes


Waybar

Custom Waybar configuration with Matugen-generated colors and scripts.


SwayNC

Custom notification center configuration and styling with dynamic colors.


DISCLAIMER

This project is heavily inspired by many different people and projects across the Linux customization community.

Some parts of this configuration may use, adapt, or be based on code and ideas from other creators. I do my best to credit the original creators and respect their work and licenses.

Some of the people and projects that have inspired or contributed to this setup include:

- SaneAspect
- Cebem1nt
- adi1090x
- And many others from the Linux ricing and customization community.

If you recognize your work here and I have missed a credit, please let me know so I can add it.

Huge thanks to everyone whose work helped inspire this setup.


Notes

These dotfiles are made for my own setup, so they may require modification before being used elsewhere.

Paths, commands, installed packages, fonts, monitor configuration, and hardware-specific settings may differ between systems.

Do not blindly copy everything into ~/.config.

Back up your existing configuration first.


Installation

Clone the repository:

git clone https://github.com/carrotsd59-creator/config.git
cd config

Then copy the configurations you actually want into:

~/.config/

I recommend reviewing the files first instead of replacing your entire configuration directory.


Main Dependencies

The setup currently revolves around:

- Hyprland
- Waybar
- Quickshell
- Rofi
- SwayNC
- Fish
- Kitty
- Matugen
- Nerd Fonts
- awww
- cliphist
- fcitx5

Some components may require additional packages depending on your setup.


License

This repository contains my personal configuration.

Individual configurations or scripts may originate from or be inspired by other projects. Check their respective files and upstream repositories for their original licenses.


Made with Linux, questionable amounts of configuration files, and an unhealthy relationship with rounded corners.
