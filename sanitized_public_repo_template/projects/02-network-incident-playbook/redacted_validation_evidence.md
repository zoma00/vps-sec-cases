# Redacted Validation Evidence - Case Study 02

## Incident Context (Sanitized)
SSH connection became unstable after network/interface configuration changes.

## Core Checks
```bash
ip a
ip route
sudo ufw status
sudo systemctl status ssh --no-pager
sudo fail2ban-client status sshd | grep -i banned
```

## Redacted Findings
```text
UFW status: active
SSH rule: 22/tcp allowed
SSHD service: active (running)
Fail2ban: active
Currently banned: 0
Total banned: 2
```

## Recovery Sequence (Sanitized)
1. Confirmed SSH allow rule before any firewall change.
2. Confirmed fail2ban was not currently blocking access.
3. Corrected network/interface settings and restarted services.
4. Re-tested SSH connectivity from local machine.

## Outcome
SSH stability restored and documented as a reusable timeout-recovery playbook.

## Redaction Notes
- All hostnames, public IPs, usernames, and sensitive identifiers removed.
- Command outputs reduced to operationally relevant evidence only.
