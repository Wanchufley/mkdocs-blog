---
date:
    created: 2025-04-16
categories:
    - Tech
slug: ufw-role
---
# **Download, install and configure UFW rules using Ansible :a:**

Quick role to configure UFW in your machines to allow local IP's and Tailscale traffic in.

![ufw.png](assets/img/ufw.png)

<!-- more -->

!!! note "Source Code"

    You cand find the source code to follow this guide on my [Github](https://github.com/Wanchufley/homelab)

# UFW Configuration Role for Ansible &nbsp;:gear: :a:

## This Ansible role configures UFW with basic security rules &nbsp;:book: :

```yaml title="defaults/main.yaml" linenums="1"
---
ssh_port: 22
allow_ssh: true
local_subnet: "192.168.178.0/24"
```

* Allows SSH if `allow_ssh: true`
* Allows all outgoing traffic
* Blocks all incoming traffic by default
* Allows internal LAN access (`local_subnet`)
* Allows all Tailscale traffic (`100.64.0.0/10`)
* Enables UFW

## Variables &nbsp;:currency_exchange: :
Customize in `vars/main.yml`:

```yaml title="vars/main.yaml" linenums="1"
---
ssh_port: 22
allow_ssh: true  # Set to false if SSH is not needed
local_subnet: "192.168.1.0/24"  # Adjust to match your home network
```

- `ssh_port`: SSH port (default: 22)
- `allow_ssh`: Whether to allow SSH (default: true)
- `local_subnet`: Your LAN subnet (default: "192.168.1.0/24")

## Create the playbook &nbsp;:pencil:
Write a simple playbook that calls the role:

```yaml title="ufw-setup.yaml" linenums="1"
- hosts: all
  become: true
  roles:
    - ufw-config
```

## Run the playbook &nbsp;:runner:

```bash title="run:" linenums="1"
ansible-playbook -i inventory ufw-setup.yaml
```

## UFW will now be properly configured across all your VMs, LXCs, and containers! &nbsp;:tada: