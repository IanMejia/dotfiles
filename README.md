# Ian's Dotfiles

---

This whole repository has been designed to be as user independent as possible,
in order to achieve this, everything was carefully constructed to guarantee that
no user directories are used, although most of the system-wide configurations
are mainly the stuff I consider necessary for my system, they should provide
everything needed to have an off the box interface. I encourage whoever uses
this dotfiles to take them with a grain of salt and instead read everything to
grab ideas on how to construct your own environment based on your needs.

![alt text](screenshots/term.png?raw=true "Random terminals")
![alt text](screenshots/zathura?raw=true "PDF reader")

## Dependencies

- *Window Manager:*

  - Bspwm with polybar.

- *Shell:*

  - Zsh with prezto (Autoinstall included).

- *Terminal:*

  - St (Personal build included).

- *Editor:*

  - Neovim. Vim-like bindings for zsh also.

- *Document Viewer:*

  - Zathura, with sane defaults.

- *Font:*
  - JuliaMono, I love Julia and the access to unicodefonts

For arch-like distros, a dependency list is also included to autoinstall.
It should be as easy as `cd` to the dotfiles directory and executing.

```sh
chmod +x arch-dependencies.sh
./arch-dependencies.sh
```

Taskbars are bloat, but we cannot live without them. Mine uses polybar and is
constructed around what I consider optimal, screenshot for reference:
![alt text](screenshots/polybar.png?raw=true "Taskbar")

A basic dmenu-like menu, with a simple color scheme to be compatible with the
rest:
![alt text](screenshots/rofi?raw=true "Menu")


## Dotfile Installation

Installation is quite easy, while on the *dotfiles* folder execute:

```sh
chmod +x bootstrap.sh
./bootstrap.sh
```

Which is meant to *symlink* all the dotfiles to their respective place. When the
terminal restarts, everything should start downloading. It might take a couple
minutes, depending on your internet speed.
