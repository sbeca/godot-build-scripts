#!/bin/sh

# Install Xcode command line tools if they're not already installed
xcode-select --install

# Install brew if it's not already installed
command -v brew >/dev/null 2>&1 || { echo "=== Installing brew ==="; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

echo "=== Updating brew and everything installed via brew ==="
brew update
brew upgrade

# Install scons, which is needed for the Godot build system
echo "=== Installing scons via brew ==="
brew install scons

# Install mingw-w64, which is needed to compile Godot for Windows
echo "=== Installing mingw-w64 via brew ==="
brew install mingw-w64
