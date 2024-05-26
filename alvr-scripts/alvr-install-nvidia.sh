#!/bin/bash

wget https://github.com/alvr-org/ALVR/archive/refs/tags/v20.8.1.tar.gz
tar -xvzf v20.8.1.tar.gz
rm v20.8.1.tar.gz
cd ALVR-20.8.1
sudo pacman -S clang curl nasm pkgconf yasm vulkan-headers libva-mesa-driver unzip ffmpeg --needed --noconfirm
cargo xtask prepare-deps --platform linux
cargo xtask build-streamer --release
mkdir ~/ALVR
cp -r build/alvr_streamer_linux/ ~/ALVR
cd ..
rm -rf ALVR-20.8.1
echo "done!"

