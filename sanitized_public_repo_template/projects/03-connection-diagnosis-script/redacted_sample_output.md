# Redacted Sample Output - Case Study 03

## Command
```bash
sudo ./connection_diagnosis.sh
```

## Redacted Execution Snapshot
```text
[1] Interfaces .......... Captured
[2] Routes .............. Captured
[3] DNS check ........... OK
[4] Reachability ........ OK
[5] Service ports ....... Collected
[6] Firewall status ..... Active
[7] Recent logs ......... Collected
Done.
```

## Interpretation Guide
- If DNS fails but route is present: investigate resolver/network egress.
- If firewall is active and service unreachable: verify inbound allow rules.
- If logs show repeated auth or connection errors: follow with SSH service and fail2ban checks outside this script.

## Redaction Notes
All infrastructure identifiers, hostnames, and non-essential system details are removed.
