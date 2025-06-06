# ✅ Step-by-Step: Setup Your Dotfiles (Including Git) on a New Machine

## 1. Install Git

```bash
sudo apt install git  # Debian/Ubuntu
# or
sudo pacman -S git    # Arch
```

---

## 2. Clone Your Dotfiles Repo

Example using SSH or HTTPS:

```bash
# Option 1: HTTPS
git clone https://gitea.xrx-tech.org/wanchufley/homelab ~/repositories/homelab

# Option 2: SSH (preferred if you’ve set up SSH keys)
git clone git@gitea.xrx-tech.org:wanchufley/homelab.git ~/repositories/homelab
```

---

## 3. Run the Bootstrap Script

```bash
cd ~/repositories/homelab
chmod +x bootstrap.sh
./bootstrap.sh
```

This will:
- Back up existing configs (`.bashrc.bak`, etc.)
- Symlink your dotfiles into place

---

## 4. Set Up Git Credential Storage (Optional but Handy)

If you use HTTPS and want Git to remember your credentials:

```bash
git config --global credential.helper store
```

After this, Git will prompt you once for credentials, then store them in plain text at:

```
~/.git-credentials
```

✅ Since your `.gitconfig` is symlinked already, it will also use your name and email from there.

---

## 5. Verify Git Config

```bash
git config --list --show-origin
```

This will show you:
- Where each config is coming from
- That your symlinked `~/.gitconfig` is being used