# Case Study 02: SSH Timeout Recovery Playbook (Post Network Interface Change)

Status: Completed (sanitized from operational notes)

## Objective
Recover stable SSH access after a connection timeout incident and convert the recovery process into a repeatable support runbook.

## Incident Summary
After network/interface changes, SSH access became unstable. The goal was to confirm whether the issue came from firewall policy, SSH service state, Fail2ban bans, or network routing drift, then restore stable access safely.

## Troubleshooting Workflow
1. Verified local and remote interface/routing state.
2. Confirmed SSH service health and listener availability.
3. Verified UFW policy and explicit SSH allowance.
4. Checked Fail2ban jail status to rule out active bans.
5. Applied controlled recovery actions and revalidated SSH.

## Validation Commands
```bash
ip a
ip route
sudo ufw status
sudo systemctl status ssh --no-pager
sudo fail2ban-client status sshd
sudo fail2ban-client status sshd | grep -i banned
```

## Representative Redacted Validation Output
```text
Status: active
22/tcp  ALLOW  Anywhere

fail2ban.service - active (running)
Currently banned: 0
Total banned: 2
```

## Recovery Actions Used
- Kept SSH explicitly allowed in firewall policy.
- Kept Fail2ban active as the brute-force control layer.
- Used a backup-first approach before risky network changes.
- Restarted networking/SSH services after configuration corrections.

## Results
- SSH stability restored after controlled rollback/validation steps.
- Root-cause isolation became faster through ordered checks.
- Produced a reusable incident-response sequence for future outages.

## Lessons Learned
- Backup/snapshot before network-interface changes on remote VPS.
- Validate firewall, SSH service, and fail2ban together, not in isolation.
- Keep recovery steps documented to reduce downtime and operator error.

## Public-safe Artifacts
- Redacted incident timeline and command/output checks
- Recovery checklist for timeout-related SSH incidents
- Supporting file: `redacted_validation_evidence.md`
