# Sanitization Checklist (Before Public Push)

## Must remove
- Real server IP addresses, domains, hostnames, usernames
- Any passwords, API keys, secrets, tokens, cookies, private keys
- Any direct references to bypassing detection or hiding activity
- Tor/anonymity operational workflows and artifacts
- Internal-only screenshots containing account/server metadata

## Must rewrite
- Replace "anonymity/evasion" wording with defensive language:
  - "privacy-aware testing controls"
  - "defensive network validation"
  - "secure lab configuration"
- Keep outcomes framed as reliability, hardening, and incident handling

## Must verify
- `git grep -n -i 'password|token|secret|api[_-]?key|private[_-]?key|id_rsa|BEGIN RSA|wallet|burner|tor'`
- `.env`, key files, and credential exports are absent
- No binaries or huge vendor bundles (for example full browser bundles)

## Final checks
- Case studies are reproducible and sanitized
- Scope and ethics are clearly documented
- README links work and project structure is clean
