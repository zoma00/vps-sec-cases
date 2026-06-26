# Sanitization Checklist (Before Export or External Release)

Use this checklist before exporting any case study, script, screenshot, log excerpt, or repository material into books, samples, platform content, or other external releases.

The goal is simple:
- keep the work technically useful
- remove anything sensitive
- preserve a defensive and professional scope

## 1. Must remove immediately
- Real server IP addresses
- Real domains, subdomains, internal hostnames, and DNS records that should stay private
- Real usernames, email addresses, session IDs, cookies, tokens, API keys, passwords, and private keys
- Infrastructure identifiers such as instance IDs, account IDs, tenant IDs, project IDs, subscription IDs, or billing references
- Sensitive filesystem paths that expose internal usernames, customer names, or server layout
- Direct references to bypassing detection, evasion, stealth, or hiding activity
- Client names, employer names, or third-party identifiers that are not already public and approved for disclosure
- Internal-only screenshots that expose account dashboards, mailboxes, provider panels, terminal prompts, or browser tabs with sensitive metadata

## 2. Must generalize or redact
- Replace real IPs with example ranges such as `192.0.2.10`, `198.51.100.25`, or `203.0.113.7`
- Replace real domains with neutral examples such as `example.internal` or `redacted.example`
- Replace real usernames with placeholders such as `admin-user` or `service-account`
- Replace exact ticket IDs, incident IDs, or alert IDs unless they are already safe to disclose
- Trim logs to the minimum lines needed to explain the case
- Crop screenshots so they show only the technical evidence required for the lesson

## 3. Must rewrite for external publication scope
- Keep the language defensive:
  - hardening
  - incident response
  - validation
  - troubleshooting
  - service reliability
- Remove wording that sounds offensive, evasive, or adversarial unless it is necessary for context and carefully reframed
- Do not publish "how to bypass" framing
- Do not publish experimental lab notes as if they were production guidance
- Keep each case study focused on:
  - the problem
  - the defensive steps
  - the validation
  - the operational outcome

## 4. Screenshots and media checks
- Check the full image, not only the center of the screenshot
- Review browser tabs, bookmarks bar, terminal title, shell prompt, notification area, and sidebars
- Remove or blur:
  - account email addresses
  - server names
  - provider IDs
  - internal URLs
  - sensitive timestamps if they expose a live response window
- If a screenshot is too noisy to sanitize cleanly, replace it with:
  - a cropped excerpt
  - a rewritten command example
  - a diagram or recreated sample

## 5. File and repository hygiene
- Do not commit `.env` files
- Do not commit exported mailbox files, provider backups, browser profiles, or credential bundles
- Do not commit large binaries unless they are required and safe
- Do not commit generated artifacts that may hide metadata you did not inspect
- Keep repo history clean before creating any external release package from repository material

## 6. Command-line verification
Run these checks locally before pushing:

- `git status`
- `git diff --cached`
- `git grep -n -i 'password|token|secret|api[_-]?key|private[_-]?key|id_rsa|BEGIN RSA|cookie|authorization|bearer|session'`
- `git grep -n -i 'internal|corp|customer|client|tenant|account id|subscription id'`
- `find . -type f \\( -name '.env' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa*' \\)`

If the case includes network or privacy-sensitive workflows, also check for:

- `git grep -n -i 'tor|proxychains|socks5|burner|wallet'`

## 7. Manual review before export
- Read the full README as if you were an external reader with no private context
- Confirm every linked file is intended for export or controlled external sharing
- Confirm each case study is still understandable after redaction
- Confirm the repo title, summary, and tags match defensive operations work
- Confirm no hidden assumptions require private infrastructure knowledge

## 8. Final export gate
Only export or externally publish when all statements below are true:

- The case study is reproducible without exposing secrets
- The redactions do not weaken the main lesson
- The material is accurate, scoped, and professional
- The repo contains only files that are intended to remain in the controlled source set or to support sanitized export
- README links work and project structure is clean
- Scope and ethics are clearly documented

## 9. Recommended working rule
When uncertain, remove the detail or rewrite it.

It is better to publish a slightly less detailed excerpt than to leak an identifier, credential, or private operational pattern.
