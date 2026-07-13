#!/bin/bash

set -e

echo "Checking operating system..."

OS=$(uname)

if [ "$OS" = "Darwin" ]; then

    echo "Detected macOS"

    if ! command -v brew &> /dev/null
    then
        echo "Homebrew not installed. Install Homebrew first."
        exit 1
    fi

    echo "Installing prerequisites using Homebrew"

    brew install openjdk@17
    brew install maven
    brew install git

elif [ "$OS" = "Linux" ]; then

    echo "Detected Linux"

    sudo apt update

    sudo apt install -y \
    git \
    openjdk-17-jdk \
    maven \
    curl

else

    echo "Unsupported operating system: $OS"
    exit 1

fi

echo "Prerequisites installed successfully"
