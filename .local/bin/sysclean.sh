#!/bin/bash

read -p "reset to apt-snapshot.list/pacman-snapshot.list packages? [y/N]" ans
[ "$ans" != "y" ] && exit

# https://wiki.archlinux.org/title/Pacman/Rosetta

if [ -e /bin/apt ]; then

  # List packages installed explicitly (not as dependencies)
  # apt-mark showmanual > apt-snapshot.list

  # Install package(s) as dependency / without marking as explicitly required.
  sudo apt-mark auto $(apt-mark showmanual)

  # Mark a package previously installed as a dependency as explicitly required.
  sudo apt-mark manual $(cat apt-snapshot.list)

  # Remove a package(s) and all dependencies and configuration files
  sudo apt autoremove --purge

else

  # https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages
  # pacman -Qqe > pacman-snapshot.list

  # https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_everything_but_essential_packages
  sudo pacman -D --asdeps $(pacman -Qqe)
  sudo pacman -D --asexplicit - < pacman-snapshot.list

  # https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans)
  sudo pacman -Rscn $(yay -Qtdq)

fi
