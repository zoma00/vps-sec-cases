#!/usr/bin/env bash
# Public-safe diagnostics template (replace/extend with your sanitized version)

set -euo pipefail

echo "[1] Interfaces"
ip a || true

echo "[2] Routes"
ip route || true

echo "[3] DNS check"
nslookup example.com || dig example.com || host example.com || true

echo "[4] Reachability"
ping -c 2 8.8.8.8 || true

echo "[5] Service ports"
ss -tuln || true

echo "[6] Firewall status"
ufw status || true

echo "[7] Recent network logs"
grep -i network /var/log/syslog | tail -20 || true

echo "Done."
