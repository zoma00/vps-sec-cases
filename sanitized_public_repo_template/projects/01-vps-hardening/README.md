# Case Study 01: Linux VPS Hardening Baseline (UFW + Fail2ban)

## Objective
Establish a safer baseline for remote Linux server administration by enforcing firewall policy and SSH brute-force protection without causing SSH lockout.

## Environment (Sanitized)
- OS: Ubuntu Server (production-like VPS environment)
- Security controls: UFW, Fail2ban, OpenSSH
- Context: remote administration over SSH with validation-first rollout

## Problem Statement
Default VPS exposure and manual configuration drift increase the risk of unauthorized access and operator lockout. The goal was to harden inbound access while keeping remote administration stable.

## Actions Executed
1. Assessed baseline firewall and service state.
2. Applied SSH-safe firewall sequencing:
	- Explicitly allowed SSH before enabling UFW.
	- Enabled UFW and verified policy.
3. Installed and activated Fail2ban for SSH protection.
4. Verified service activation and startup persistence.
5. Re-checked final firewall and security service status.

## Validation Commands
```bash
sudo ufw status verbose
sudo systemctl status fail2ban --no-pager
sudo fail2ban-client status
sudo ss -tuln
```

## Representative Redacted Validation Output
```text
Status: active
Default: deny (incoming), allow (outgoing)

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere

fail2ban.service - active (running)
```

## Results
- Firewall policy moved to explicit inbound control with safe SSH continuity.
- SSH brute-force mitigation enabled through Fail2ban.
- Created repeatable hardening workflow that can be reused across new server setups.

## Operational Impact
- Reduced accidental exposure of unused inbound ports.
- Reduced risk of SSH credential abuse attempts.
- Improved confidence during remote changes through stepwise validation.

## Lessons Learned
- Always whitelist SSH before enabling or tightening firewall policy on a remote host.
- Security hardening should be performed as a sequenced runbook with immediate post-change validation.
- Pairing UFW (network control) with Fail2ban (behavior control) is more robust than using either alone.

## Public-safe Artifacts
- Redacted command flow for UFW enablement and verification
- Redacted Fail2ban activation and status checks
- Hardening runbook summary for repeatable execution
- Supporting file: `redacted_validation_evidence.md`

## Scope and Ethics
This case study demonstrates defensive system administration and security hardening only.
All infrastructure identifiers are sanitized or omitted.
