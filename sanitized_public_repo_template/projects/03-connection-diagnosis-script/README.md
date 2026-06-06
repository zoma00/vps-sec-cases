# Case Study 03: Connection Diagnosis Script

Status: Completed (sanitized from operational notes)

## Objective
Provide a fast first-pass diagnostics script to reduce triage time during Linux connectivity incidents.

## Script Coverage
- Interface and IP state
- Routing table visibility
- DNS resolution checks
- External network reachability
- Open/listening ports
- Firewall status
- Recent network-related logs

## Usage
```bash
chmod +x connection_diagnosis.sh
sudo ./connection_diagnosis.sh
```

## Validation Focus
- Confirm script executes without manual intervention.
- Confirm outputs provide enough context for first-line incident decisions.
- Compare pre-remediation and post-remediation snapshots.

## Representative Redacted Output (Excerpt)
```text
[1] Interfaces .......... OK
[2] Routes .............. OK
[3] DNS check ........... OK
[4] Reachability ........ OK
[5] Service ports ....... Collected
[6] Firewall status ..... Active
[7] Recent logs ......... Collected
Done.
```

## Results
- Standardized first-pass diagnostics across incidents.
- Improved handoff quality by collecting consistent baseline evidence.
- Reduced time spent on ad-hoc command selection during outages.

## Public-safe Artifacts
- Script file: `connection_diagnosis.sh`
- Redacted execution excerpt
- Supporting file: `redacted_sample_output.md`
