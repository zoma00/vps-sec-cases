#!/usr/bin/env bash
# Public-safe SSH timeout triage helper.
# This script collects first-pass state only. It does not restart services or alter networking.

set -euo pipefail

if [[ "${1:-}" == "--help" ]]; then
  cat <<'EOF'
Usage: ./ssh_timeout_triage.sh

Read-only checks:
- Interface state
- Routing table
- SSH service state
- Listening ports
- UFW status
- Fail2ban sshd status

This script is intentionally non-destructive.
EOF
  exit 0
fi

have_cmd() {
  command -v "$1" >/dev/null 2>&1
}

section() {
  printf '\n[%s] %s\n' "$1" "$2"
}

note() {
  printf '  INFO: %s\n' "$1"
}

section 1 "Safety reminder"
note "Before risky remote recovery work, ensure console access, snapshot, or rollback path exists."

section 2 "Interface state"
if have_cmd ip; then
  ip a || true
else
  note "ip command is not available."
fi

section 3 "Routing table"
if have_cmd ip; then
  ip route || true
fi

section 4 "SSH service state"
if have_cmd systemctl; then
  systemctl is-active ssh 2>/dev/null || systemctl is-active sshd 2>/dev/null || true
  sudo systemctl status ssh --no-pager 2>/dev/null || sudo systemctl status sshd --no-pager 2>/dev/null || true
else
  note "systemctl is not available."
fi

section 5 "Listening ports"
if have_cmd ss; then
  sudo ss -tuln 2>/dev/null || ss -tuln || true
else
  note "ss is not available."
fi

section 6 "UFW status"
if have_cmd ufw; then
  sudo ufw status 2>/dev/null || ufw status || true
else
  note "UFW is not installed."
fi

section 7 "Fail2ban sshd status"
if have_cmd fail2ban-client; then
  sudo fail2ban-client status sshd 2>/dev/null || true
  sudo fail2ban-client status sshd 2>/dev/null | grep -i banned || true
else
  note "fail2ban-client is not installed."
fi

section 8 "Triage note"
note "Use this output to decide whether the issue is routing, SSH service, firewall policy, or fail2ban-related."
note "Do not automate remote recovery changes until you have a safe rollback path."
