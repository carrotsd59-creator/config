# My Linux Dotfiles

My personal Linux desktop configuration, built around **Hyprland, Quickshell, Waybar, Rofi, SwayNC, Fish, Kitty, and Matugen**.

The setup is heavily inspired by **macOS, Material You, and Microsoft Fluent Design**, with a focus on dynamic colors, smooth animations, custom desktop components, and a clean interface.

It is still a work in progress. Things will probably break. That's part of the experience.

<img width="1920" height="1080" alt="Desktop screenshot" src="https://github.com/user-attachments/assets/670ef088-3f8f-451b-a812-d0b4d33bb763" />

## Features

* **Hyprland** - Wayland compositor and window management
* **Quickshell** - Custom desktop shell and UI components
* **Waybar** - Status bar
* **Rofi** - Application launcher, clipboard, wallpaper picker, and power menu
* **SwayNC** - Notification center
* **Fish** - Shell configuration and custom prompt
* **Kitty** - Terminal configuration
* **Matugen** - Dynamic Material You color generation
* **awww** - Wallpaper daemon
* **cliphist** - Clipboard history
* **fcitx5** - Input method framework
* Dynamic colors shared across multiple applications
* Custom keybinds, animations, window rules, and desktop behavior

## Desktop

| Component     | Software            |
| :------------ | :------------------ |
| WM            | Hyprland            |
| Shell         | Fish                |
| Terminal      | Kitty               |
| Launcher      | Rofi                |
| Bar           | Waybar / Quickshell |
| Notifications | SwayNC              |
| Theming       | Matugen             |
| Desktop UI    | Quickshell          |

## Quickshell

Quickshell is used as the main framework for custom desktop UI and shell components.

The configuration is split into reusable modules rather than keeping everything inside one huge `shell.qml`.

Current shell modes:

| Mode            | Description                                      |
| :-------------- | :----------------------------------------------- |
| **Dynaland**    | Main rounded desktop shell                       |
| **Square Mode** | Square-focused shell with its own Quickshell bar |

### Dynaland

Dynaland is the main shell configuration.

It provides custom components such as:

* Dynamic Island-style UI
* Media controls
* Status controls
* Sliders
* Settings
* Hover interactions
* Screen corner components
* Matugen-powered colors

The design is mainly focused on rounded surfaces, dynamic colors, and a macOS-inspired desktop experience.

### Square Mode

Square Mode is an alternative desktop configuration designed around a more rectangular and minimal visual style.

It uses a separate Quickshell bar and changes the Hyprland layout to match the square aesthetic:

| Setting               | Value                    |
| :-------------------- | :----------------------- |
| `decoration.rounding` | `0`                      |
| `general.gaps_in`     | `5`                      |
| `general.gaps_out`    | `5`                      |
| Quickshell            | Separate Square Mode bar |

Square Mode can be toggled using the same keybind used for the previous Game Mode.

The goal is to make the entire desktop switch visual styles instead of only changing the bar.

## Design

The visual style is mainly inspired by:

* macOS
* Material You
* Microsoft Fluent Design

The design has evolved over time from heavily rounded interfaces toward a combination of **rounded and square UI**, depending on the selected shell mode.

The goal is a desktop that feels minimal, responsive, and slightly playful, rather than just throwing blur everywhere because Linux apparently requires 47 layers of transparency to function.

## Hyprland

The Hyprland configuration contains separated modules for:

* animations
* autostart
* decoration
* environment variables
* input
* layouts
* monitors
* window rules
* keybinds

Hyprland is also responsible for switching between the different desktop modes and applying the corresponding window spacing and rounding.

## Matugen

Matugen generates dynamic colors from the current wallpaper and provides templates for different applications.

matugen/
└── templates/
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

This allows the same generated color palette to be shared across the desktop.

## Rofi

Rofi is used for several desktop utilities:

* Application launcher
* Clipboard launcher
* Wallpaper picker
* Power menu
* Custom themes

## Waybar

Waybar provides the traditional status bar configuration.

It uses Matugen-generated colors and custom scripts for desktop information and controls.

Quickshell is used alongside it for more advanced custom desktop UI.

## SwayNC

SwayNC provides the notification center and notification styling.

Its colors are generated dynamically through Matugen to keep the notification UI consistent with the rest of the desktop.

## Structure

The repository is organized around individual application configurations and reusable components.


config/
├── hypr/
├── quickshell/
├── waybar/
├── rofi/
├── swaync/
├── fish/
├── kitty/
├── matugen/
└── ...


The exact structure may change as the configuration evolves.

## Installation

Clone the repository:

```
git clone https://github.com/carrotsd59-creator/config.git
cd config
```

Then copy or link the configurations you actually want into:

```
~/.config/
```

I recommend reviewing the files first instead of replacing your entire configuration directory.

For Quickshell configurations, individual shell configurations can be launched separately when needed.

## Main Dependencies

The setup currently revolves around:

* Hyprland
* Quickshell
* Waybar
* Rofi
* SwayNC
* Fish
* Kitty
* Matugen
* Nerd Fonts
* awww
* cliphist
* fcitx5

Some components may require additional packages depending on your system.

## Notes

These dotfiles are made for my own setup, so they may require modification before being used elsewhere.

Paths, commands, installed packages, fonts, monitor configuration, hardware-specific settings, and compositor options may differ between systems.

**Do not blindly copy everything into `~/.config`.**

Back up your existing configuration first.

## Disclaimer

This project is heavily inspired by many different people and projects across the Linux customization community.

Some parts of this configuration may use, adapt, or be based on code and ideas from other creators. I do my best to credit the original creators and respect their work and licenses.

Some of the people and projects that have inspired or contributed to this setup include:

* SaneAspect
* Cebem1nt
* adi1090x
* Many others from the Linux ricing and customization community

If you recognize your work here and I have missed a credit, please let me know so I can add it.

Huge thanks to everyone whose work helped inspire this setup.

## License

This repository contains my personal configuration.

Individual configurations or scripts may originate from or be inspired by other projects. Check their respective files and upstream repositories for their original licenses.

## Credits

Built with:

* Hyprland
* Quickshell
* Waybar
* Rofi
* SwayNC
* Fish
* Kitty
* Matugen

And an unreasonable number of configuration files.

---

**Made with Linux, questionable amounts of configuration, and an unhealthy relationship with both rounded corners and square corners.**
