#!/bin/bash

declare -A packages
packages=(
    ["nano"]=""
)

install_package() {
    local package_name=$1

    if [[ -z "${packages[$package_name]}" ]]; then
        echo "Error: Package '$package_name' not found."
        exit 1
    fi

    local file_url=${packages[$package_name]}
    local file_name=$(basename "$file_url")
    
    echo "Downloading $package_name from $file_url..."
    wget -O "$file_name" "$file_url"

    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to download $package_name."
        exit 1
    fi

    echo "Moving $file_name to /usr/local/bin..."
    sudo mv "$file_name" /usr/local/bin/

    sudo chmod +x /usr/local/bin/"$file_name"

    echo "$package_name has been installed successfully."
}

if [[ $# -ne 2 || "$1" != "install" ]]; then
    echo "Usage: $0 install <package_name>"
    exit 1
fi

install_package "$2"
