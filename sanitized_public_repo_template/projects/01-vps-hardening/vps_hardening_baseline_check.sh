#!/usr/bin/env bash
# Public-safe baseline audit for VPS hardening case study.
# This script reports current state only. It does not change firewall or service configuration.

set -euo pipefail

if [[ "${1:-}" == "--help" ]]; then
  cat <<'EOF'
Usage: ./vps_hardening_baseline_check.sh

Read-only checks:
- SSH service state
- UFW installation and status
- Whether an SSH allow rule appears in UFW output
- Fail2ban installation and service state
- Listening ports snapshot

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

ok() {
  printf '  OK: %s\n' "$1"
}

warn() {
  printf '  WARN: %s\n' "$1"
}

note() {
  printf '  INFO: %s\n' "$1"
}

section 1 "SSH service state"
if have_cmd systemctl; then
  ssh_state="$(systemctl is-active ssh 2>/dev/null || systemctl is-active sshd 2>/dev/null || true)"
  if [[ "$ssh_state" == "active" ]]; then
    ok "SSH service is active."
  else
    warn "SSH service is not reported as active."
  fi
else
  warn "systemctl is not available."
fi

section 2 "UFW status"
if have_cmd ufw; then
  ufw_status="$(sudo ufw status verbose 2>/dev/null || true)"
  if grep -qi '^status: active' <<<"$ufw_status"; then
    ok "UFW is active."
  else
    warn "UFW is not active or status could not be read."
  fi

  if grep -Eqi '(^|[[:space:]])(22/tcp|OpenSSH)[[:space:]]+ALLOW' <<<"$ufw_status"; then
    ok "An SSH allow rule appears in UFW output."
  else
    warn "No obvious SSH allow rule found in UFW output."
  fi

  printf '%s\n' "$ufw_status"
else
  warn "UFW is not installed."
fi

section 3 "Fail2ban state"
if have_cmd fail2ban-client; then
  fail2ban_status="$(sudo fail2ban-client status 2>/dev/null || true)"
  if [[ -n "$fail2ban_status" ]]; then
    ok "Fail2ban responded to status query."
    printf '%s\n' "$fail2ban_status"
  else
    warn "Fail2ban did not return status."
  fi
else
  warn "fail2ban-client is not installed."
fi

if have_cmd systemctl; then
  fail2ban_service_state="$(systemctl is-active fail2ban 2>/dev/null || true)"
  if [[ "$fail2ban_service_state" == "active" ]]; then
    ok "Fail2ban service is active."
  else
    warn "Fail2ban service is not reported as active."
  fi
fi

section 4 "Listening ports snapshot"
if have_cmd ss; then
  sudo ss -tuln 2>/dev/null || ss -tuln || true
else
  warn "ss is not available."
fi

section 5 "Safety reminder"
note "This script is an audit helper only."
note "Apply firewall or Fail2ban changes manually after validating SSH-safe sequencing."
