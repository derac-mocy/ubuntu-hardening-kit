#!/bin/bash

# Automated Linux System Hardening Script
# Tested on Ubuntu 20.04 / Debian 11

LOG_FILE="/var/log/system_hardening.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting system hardening..."

# 1. Disable root SSH login
echo "[+] Disabling root SSH login..."
sed -i 's/^PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# 2. Set strong password policies
echo "[+] Setting strong password policies..."
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   10/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   7/' /etc/login.defs

# 3. Configure UFW firewall
echo "[+] Enabling UFW and setting basic rules..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# 4. Disable unused services
echo "[+] Disabling unused services..."
for service in telnet ftp rsh rsync; do
    systemctl disable "$service" 2>/dev/null
    systemctl stop "$service" 2>/dev/null
done

# 5. Enable auditd
echo "[+] Installing and enabling auditd..."
apt update && apt install -y auditd
systemctl enable auditd
systemctl start auditd

# 6. Set file permissions on critical files
echo "[+] Securing critical system files..."
chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow
chmod 644 /etc/passwd /etc/group
chmod 000 /etc/shadow /etc/gshadow

echo "[✔] System hardening completed successfully!"
