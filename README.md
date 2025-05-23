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
- **Tested on**: Ubuntu Server 24.04.2 LTS



## How to Use

>  Run as root or with `sudo`  
>  Backup your system or test in a virtual environment first

<<<<<<< HEAD
```bash
git clone https://github.com/derac-mocy/automated-linux-hardening.git
cd automated-linux-hardening
chmod +x harden.sh
sudo ./harden.sh
=======

## Running script on Ubuntu Server

$ git clone https://github.com/derac-mocy/ automated-linux-hardening.git
$ cd automated-linux-hardening
$ chmod +x harden.sh
$ sudo ./harden.sh


## Validating the Changes

Feature                          Command to Check
=======                          ================
SSH root login disabled          sudo grep PermitRootLogin /etc/ssh/sshd_config
Password Policy                  cat /etc/login.defs
UFW status                       sudo ufw status verbose
Disabled services                systemctl is-enabled telnet && RSH (should fail)
auditd status                    systemctl status auditd
Logs                             cat /var/log/hardening_script.log

P.S: Test validation outputs are stored in docs/visuals for further references.
>>>>>>> bf1789b (uploading appendixes)
