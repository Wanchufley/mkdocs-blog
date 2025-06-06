---
title: File Explorer
description: Browse and download configuration files, scripts, and resources
---

# 📁 File Explorer

Welcome to my file repository! This is where you can find various configuration files, scripts, and resources that I mention in my blog posts. Whether you're looking for my dotfiles, Ansible playbooks, or Docker configurations, you'll find them all organized here.

!!! note "How to Use"
    - Click on a folder (📂) to explore its contents
    - Click on a file name to view its details
    - All files are version controlled in my GitHub repository

## 📂 File Browser

### 📂 ansible
??? info "Ansible Playbooks and Roles"
    **Description**: Collection of Ansible playbooks and roles I use to automate my system configurations and deployments.
    
    *Playbooks and roles will be added as they are mentioned in blog posts...*

### 📂 docker
??? info "Docker Configurations"
    **Description**: Docker compose files and configurations for various services I run in my homelab.

    ??? abstract "arr-stack"
        **Description**: Media management stack (*arr applications)
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/arr-stack/docker-compose.yaml"
            ```
    
    ??? abstract "beszel"
        **Description**: Personal chat application
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/beszel/docker-compose.yaml"
            ```

    ??? abstract "code-server"
        **Description**: VS Code in the browser
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/code-server/docker-compose.yaml"
            ```

    ??? abstract "crafty"
        **Description**: Minecraft server manager
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/crafty/docker-compose.yaml"
            ```

    ??? abstract "gotify"
        **Description**: Self-hosted notification service
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/gotify/docker-compose.yaml"
            ```

    ??? abstract "homepage"
        **Description**: Dynamic homepage for services
        
        ??? example "View docker-compose.yml"
            ```yaml
            --8<-- "docs/resources/docker/homepage/docker-compose.yml"
            ```

    ??? abstract "it-tools"
        **Description**: Collection of IT tools and utilities
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/it-tools/docker-compose.yaml"
            ```

    ??? abstract "libreoffice"
        **Description**: LibreOffice in a container
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/libreoffice/docker-compose.yaml"
            ```

    ??? abstract "netbootxyz"
        **Description**: Network boot utility
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/netbootxyz/docker-compose.yaml"
            ```

    ??? abstract "npm"
        **Description**: Nginx Proxy Manager
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/npm/docker-compose.yaml"
            ```

    ??? abstract "ollama"
        **Description**: Local LLM runner
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/ollama/docker-compose.yaml"
            ```

    ??? abstract "paperless"
        **Description**: Document management system
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/paperless/docker-compose.yaml"
            ```

    ??? abstract "restic"
        **Description**: Backup solution
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/restic/docker-compose.yaml"
            ```

    ??? abstract "searxng"
        **Description**: Privacy-focused meta search engine
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/searxng/docker-compose.yaml"
            ```

    ??? abstract "vaultwarden"
        **Description**: Bitwarden-compatible password manager
        
        ??? example "View docker-compose.yaml"
            ```yaml
            --8<-- "docs/resources/docker/vaultwarden/docker-compose.yaml"
            ```

### 📂 dotfiles
??? info "Personal Dotfiles"
    **Description**: My personal configuration files for various tools and applications.
    These are the configuration files I use to customize my development environment.
    
    ??? abstract "zshrc"
        **Description**: ZSH shell configuration with custom aliases, paths, and functions
        
        ??? example "View zshrc"
            ```bash
            --8<-- "docs/resources/dotfiles/zshrc"
            ```
    
    ??? abstract "gitconfig"
        **Description**: Git global configuration
        
        ??? example "View gitconfig"
            ```ini
            --8<-- "docs/resources/dotfiles/gitconfig"
            ```

    ??? abstract "bashrc"
        **Description**: Bash shell configuration (alternative to zshrc)
        
        ??? example "View bashrc"
            ```bash
            --8<-- "docs/resources/dotfiles/bashrc"
            ```

    ??? abstract "bootstrap-scripts"
        **Description**: Scripts for setting up a new system
        
        ??? example "View bootstrap.sh"
            ```bash
            --8<-- "docs/resources/dotfiles/bootstrap-scripts/bootstrap.sh"
            ```
        
        ??? example "View install-packages.sh"
            ```bash
            --8<-- "docs/resources/dotfiles/bootstrap-scripts/install-packages.sh"
            ```
        
        ??? example "View packages.txt"
            ```text
            --8<-- "docs/resources/dotfiles/bootstrap-scripts/packages.txt"
            ```

    ??? abstract ".config"
        **Description**: Application-specific configurations
        
        ??? abstract "starship.toml"
            **Description**: Starship prompt configuration with Tokyo Night theme
            
            ??? example "View starship.toml"
                ```toml
                --8<-- "docs/resources/dotfiles/.config/starship.toml"
                ```
        
        ??? abstract "tmux"
            **Description**: Terminal multiplexer configuration with vim-like keybindings
            
            ??? example "View tmux.conf"
                ```conf
                --8<-- "docs/resources/dotfiles/.config/tmux/tmux.conf"
                ```
        
        ??? abstract "aerospace"
            **Description**: macOS window manager configuration (similar to i3wm)
            
            ??? example "View aerospace.toml"
                ```toml
                --8<-- "docs/resources/dotfiles/.config/aerospace/aerospace.toml"
                ```

## 💡 Contributing

If you'd like to suggest improvements or report issues with any of the files, please visit the [GitHub repository](https://github.com/Wanchufley/mkdocs-blog) and create an issue or pull request.

!!! tip "Found something interesting?"
    If you find any of these configurations useful, feel free to use them in your own setup! Just remember to review and adjust them to your needs before implementing.
