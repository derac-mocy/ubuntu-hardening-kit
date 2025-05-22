# Automated Linux System Hardening Script

This project provides a **Bash-based script** to automatically apply key Linux security hardening techniques. It's designed for **Debian/Ubuntu systems** and aims to reduce the attack surface by enforcing baseline security measures.

## Features

-  Disables root SSH login
-  Enforces strong password aging policies
-  Configures UFW firewall with default deny
-  Disables insecure/unused services (e.g., Telnet, RSH)
-  Installs and enables auditd for system logging

## Technologies Used

- **Bash scripting**
- **Systemd / SSH / UFW / auditd**
- **Tested on**: Ubuntu 20.04, Debian 11
- **Complies with**: CIS Linux Benchmark (partial)

## How to Use

>  Run as root or with `sudo`  
>  Backup your system or test in a virtual environment first

```bash
git clone https://github.com/derac-mocy/automated-linux-hardening.git
cd automated-linux-hardening
chmod +x harden.sh
sudo ./harden.sh
