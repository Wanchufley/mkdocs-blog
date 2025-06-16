#!/bin/bash

set -e  # Exit on error

echo "Creating symlinks with backups..."

# Helper function to back up and symlink
link_with_backup() {
    local source="$1"
    local target="$2"
    local backup="${target}.bak"

    # Backup if target exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up $target to $backup"
        mv "$target" "$backup"
    fi

    echo "Linking $target -> $source"
    ln -sf "$source" "$target"
}

# Base path to dotfiles
DOTFILES_DIR=~/repositories/homelab/dotfiles

# Symlink for .bashrc
link_with_backup "$DOTFILES_DIR/bashrc" ~/.bashrc

# Ensure ~/.config/tmux exists
mkdir -p ~/.config/tmux

# Symlink for tmux.conf
link_with_backup "$DOTFILES_DIR/.config/tmux/tmux.conf" ~/.config/tmux/tmux.conf

# Symlink for .gitconfig
link_with_backup "$DOTFILES_DIR/gitconfig" ~/.gitconfig

# Symlink starship.toml
link_with_backup "$DOTFILES_DIR/.config/starship.toml" ~/.config/starship.toml

echo "All symlinks created and backups made (if needed)!"
