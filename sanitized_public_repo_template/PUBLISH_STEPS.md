# Publish Steps (Fast Path)

1. Create a new GitHub repository (public).
2. Copy this template structure.
3. Add only sanitized files into each case-study folder (projects/* in this template).
4. Complete each case-study README:
   - Objective
   - Problem
   - Steps
   - Results
   - Lessons learned
5. Exclude non-fit content from recruiter-facing scope:
   - Do not publish local Tor-socks fuzzing workflows as a main case study for this IT role.
   - Keep focus on hardening, troubleshooting, diagnostics, and service reliability.
6. Run local checks:
   - `git status`
   - `git grep -n -i 'password|token|secret|api[_-]?key|private[_-]?key|id_rsa|BEGIN RSA|tor'`
7. Commit and push.
8. Add repo URL to CV and application email.

## Suggested commit sequence
- `chore: initialize sanitized public portfolio structure`
- `docs: add vps hardening case study`
- `docs: add network incident playbook`
- `feat: add connection diagnosis script and usage`
