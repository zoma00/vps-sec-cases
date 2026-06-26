# Script Safety Policy

This repository prefers sanitized audit and triage scripts over auto-remediation scripts.

## Why this policy exists
- Repositories that feed external publication assets can influence people working in different environments, privilege models, and rollback conditions.
- A script that changes firewall, SSH, networking, or service state can cause lockout or service disruption if used without preparation.
- A repository aligned to external publication should teach safe validation and decision-making first, not encourage one-click changes on live systems.

## What is recommended in this repo
- Read-only audit scripts
- Triage and evidence-collection helpers
- Reproducible validation commands
- Templates that help an operator decide what to check next

## What is not recommended in this repo
- One-step firewall hardening scripts applied blindly
- Automatic SSH or networking reconfiguration on live hosts
- Recovery scripts that restart services or alter routes without explicit operator review
- Scripts that assume a production environment matches the author's own server layout

## Safe examples in this repo
- `projects/01-vps-hardening/vps_hardening_baseline_check.sh`
  - audits SSH, UFW, Fail2ban, and listening ports
- `projects/02-network-incident-playbook/ssh_timeout_triage.sh`
  - collects first-pass recovery evidence without changing service state
- `projects/03-connection-diagnosis-script/connection_diagnosis.sh`
  - provides reusable diagnostics as the main reusable artifact

## When stronger automation may be acceptable
Stronger automation can be acceptable in a private or internal operations repository when:

- the target environment is clearly defined
- backups or snapshots exist
- console or rollback access is available
- peer review has been completed
- the script has dry-run, logging, and safety checks

## Repository publication rule
Scripts that can lock out SSH, alter routing, or affect service availability are outside the default publication scope of this template as ready-to-run remediation assets.

For this repository, the preferred externally usable artifacts are:

- audit helpers
- runbooks
- validation logic
