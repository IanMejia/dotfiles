# Ian's Dotfiles

---

This dotfiles are meant to be quite user-independent, but still, in case you end
up having them, I encourage you not to take them entirely, rather, read them up
and take whichever it is that works for you. Main terminals and neovim
colorschemes are Gruvbox.

## Dependencies

- *Window Manager:*

  - ***TODO***

- *Shell:*

  - Zsh with prezto (Autoinstall included).

- *Terminal:*

  - Kitty (Termite configs are also included).

- *Editor:*

  - Neovim. Vim-like bindings for zsh also.

- *Document Viewer:*

  - Zathura, with sane defaults.

- *Font:*
  - Fira Code

For arch-like distros, a dependency list is also included to autoinstall.
It should be as easy as `cd` to the dotfiles directory and executing.

```console
chmod +x arch-dependencies.sh
./arch-dependencies.sh
```

## Dotfile Installation

Installation is quite easy, while on the *dotfiles* folder execute:

```console
chmod +x bootstrap.sh
./bootstrap.sh
```

Which is meant to *symlink* all the dotfiles to their respective place. When the
terminal restarts, everything should start downloading. It might take a couple
minutes, depending on your internet speed.

---

## Device Configuration and Boot rules

I am currently working on a machine with some proprietary hardware, sadly. So
there are certain configurations that have to be done at startup, this are not
necessarily useful to anyone else other than me. The *system* folder contains
every file for my system.

In case someone wonders about the about my *grub* options:

- `i8042.dumbkbd=1`

  - Fixes a weird issue with my mouse-pad.

- `acpi_backlight=vendor`
  - Just sets the backlight system to the currently working one.

The other files are just meant to set my default keyboard layout and display
driver options. This extra files get copied with the `arch-dependencies.sh`
script, a prompt should appear asking if they are needed.
