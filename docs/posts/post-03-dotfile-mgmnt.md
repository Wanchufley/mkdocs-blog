---
date:
    created: 2025-04-16
tags:
    - configuration
    - shell
    - linux
slug: dotfile-mgm
---
# **Simple way to manage all of your dotfiles :card_file_box:**

You can learn how I manage my dotfiles in the simplest way that I know.

![dotfiles.png](assets/img/dotfiles.png)

<!-- more -->

# ✅ Step-by-Step: Setup Your Dotfiles (Including Git) on a New Machine

## :one: Install Git &nbsp;:twisted_rightwards_arrows:

```bash title="Install as per your package manager" linenums="1"
sudo apt install git  # Debian/Ubuntu
# or
sudo pacman -S git    # Arch
```

---

## :two: Clone Your Dotfiles Repo &nbsp;:dancers:

Example using SSH or HTTPS:

```bash title="Choose your preference" linenums="1"
# Option 1: HTTPS
git clone https://gitea.xrx-tech.org/wanchufley/homelab ~/repositories/homelab

# Option 2: SSH (preferred if you’ve set up SSH keys)
git clone git@gitea.xrx-tech.org:wanchufley/homelab.git ~/repositories/homelab
```

---

## :three: Run the Bootstrap Script &nbsp;:runner: :scroll:

```bash title="Change directory and run it like this:"
cd ~/repositories/homelab
chmod +x bootstrap.sh
./bootstrap.sh
```

This will:

- Back up existing configs (`.bashrc.bak`, etc.)
- Symlink your dotfiles into place

!!! warning "if you cant run it:"

    Chech if the file is executable by running **ls -l**, and if it isnt't run: **chmod +x nameofthefile**

---

## :four: Set Up Git Credential Storage (Optional but Handy) &nbsp;:floppy_disk:

If you use HTTPS and want Git to remember your credentials:

```bash title="Set the type of credential helper you want, in this case, store" linenums="1"
git config --global credential.helper store
```

After this, Git will prompt you once for credentials, then store them in plain text at:

```
~/.git-credentials
```

Since your `.gitconfig` is symlinked already, it will also use your name and email from there.

!!! warning "Check for the file"

    If after your first push you go to your home directory and you don't see the file, just manually create it yourself adding the credentials in the following way: **https://username:token@github.com**

---

## :five: Verify Git Config &nbsp;✅

```bash title="run the following command:" linenums="1"
git config --list --show-origin
```

This will show you:

- Where each config is coming from
- That your symlinked `~/.gitconfig` is being used