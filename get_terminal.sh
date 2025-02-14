#!/bin/bash
sudo apt install powerline terminator fonts-powerline
mkdir -b /usr/share/fonts/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/LiberationMono/LiterationMonoNerdFontMono-Regular.ttf -O /usr/share/fonts/fonts/LiterationMonoNerdFontMono-Regular.ttf
fc-cache -f
