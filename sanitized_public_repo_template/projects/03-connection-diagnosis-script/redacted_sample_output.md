# Redacted Sample Output - Case Study 03

## Command
```bash
sudo ./connection_diagnosis.sh
```

## Redacted Execution Snapshot
```text
[1] Interfaces
<interface inventory captured>

[2] Routes
<default route and local routes captured>

[3] DNS check
<resolver responded successfully>

[4] Reachability
<external reachability check succeeded>

[5] Service ports
<listening sockets captured>

[6] Firewall status
Status: active

[7] Recent network logs
<recent network-related entries captured>

Done.
```

## Interpretation Guide
- If DNS fails but route is present: investigate resolver/network egress.
- If firewall is active and service unreachable: verify inbound allow rules.
- If logs show repeated auth/network errors: correlate with SSH and fail2ban checks.

## Redaction Notes
All infrastructure identifiers, hostnames, and non-essential system details are removed.
