# Redacted Validation Evidence - Case Study 01

## UFW Sequencing (Sanitized)
```bash
sudo ufw allow ssh
sudo ufw enable
sudo ufw status verbose
```

### Result (Redacted)
```text
Status: active
Default: deny (incoming), allow (outgoing)
22/tcp  ALLOW IN  Anywhere
```

## Fail2ban Activation (Sanitized)
```bash
sudo apt install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo systemctl status fail2ban --no-pager
```

### Result (Redacted)
```text
fail2ban.service - loaded
Active: active (running)
```

## Post-change Safety Check
```bash
sudo ss -tuln
sudo fail2ban-client status
```

### Result (Redacted)
```text
SSH service reachable on configured port.
Fail2ban jail loaded and monitoring active.
```

## Notes
- All IPs, hostnames, usernames, and environment identifiers are removed.
- Outputs are represented in sanitized format for public sharing.
