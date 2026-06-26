# Publish Steps

Use this workflow before exporting repository material into books, samples, platform content, or other external releases.

## 1. Prepare the source structure
1. Create or open the private source repository.
2. Keep the export-ready material inside this template structure.
3. Add only files that are intended to stay in the controlled source set.
4. Keep internal notes, raw evidence, and unsanitized working material outside the export-ready tree.

## 2. Build the case study content
For each project under `projects/*`, complete the case-study README with these sections:

- `Objective`
- `Environment`
- `Problem`
- `Steps`
- `Validation`
- `Results`
- `Lessons learned`

Keep the scope centered on:

- hardening
- troubleshooting
- validation
- service reliability
- incident response

## 3. Sanitize before staging
Before `git add`, review:

- `SANITIZATION_CHECKLIST.md`
- `docs/evidence_guidelines.md`
- `docs/script_safety_policy.md`

Make sure:

- secrets and identifiers are removed
- screenshots are cropped or redacted
- wording stays defensive and professional
- the case remains understandable after redaction
- any included script stays within the repo's audit/triage safety model unless there is a strong reason otherwise

## 4. Stage only safe files
Add only the files you have reviewed.

Do not stage:

- `.env` files
- private keys
- exported mailbox data
- raw provider exports
- unsanitized screenshots
- temporary lab artifacts

## 5. Run local verification checks
Run these before every major repo update and before any external content export:

- `git status`
- `git diff --cached`
- `git grep -n -i 'password|token|secret|api[_-]?key|private[_-]?key|id_rsa|BEGIN RSA|cookie|authorization|bearer|session'`
- `git grep -n -i 'internal|corp|customer|client|tenant|account id|subscription id'`
- `find . -type f \\( -name '.env' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa*' \\)`

If the material includes privacy-sensitive network workflows, also run:

- `git grep -n -i 'tor|proxychains|socks5|burner|wallet'`

## 6. Perform the manual export review
Before pushing or exporting, verify:

- README links work
- the repo title and summary match defensive operations work
- all export-ready files are intentional
- no screenshot or log still exposes internal metadata
- no wording reads like evasion or bypass guidance

## 7. Commit and push
Commit only after the staged diff passes both the automated checks and manual review.

Why this matters:

- `git add` only stages files
- it does not prove the staged content is safe
- the last strong check before commit is reading the staged diff carefully

Recommended review flow:

1. Run `git status`
2. Run `git diff`
3. Stage the intended files with `git add <file>`
4. Run `git diff --cached`
5. If the staged content is correct, commit it
6. If the staged content is wrong, unstage it with `git restore --staged <file>` and fix it before continuing

What each command shows:

- `git diff`
  - shows unstaged changes
  - use it before staging to check what you modified locally
- `git diff --cached`
  - shows staged changes
  - this is the exact content that will go into the next commit
- `git diff --cached --name-only`
  - shows only the filenames currently staged
  - useful for a quick check that no unexpected file is included
- `git diff --cached --stat`
  - shows a short summary of how many lines changed per file
  - useful when the diff is large and you want a fast risk scan first

How to read the diff:

- `diff --git a/file b/file`
  - tells you which file changed
- `--- a/file`
  - the old version
- `+++ b/file`
  - the new version
- `@@ ... @@`
  - the current change block, also called a hunk
- lines starting with `-`
  - content being removed
- lines starting with `+`
  - content being added
- lines starting with a space
  - unchanged context shown to help you understand where the change happened

What to look for in the diff before commit:

- real IP addresses
- real domain or subdomain values
- real usernames or email addresses
- tokens, cookies, credentials, or secrets
- raw logs with more detail than needed
- wording that sounds like bypass or evasion guidance
- files that should not leave the private source repository

Important limitation:

- `git diff` is strongest for text files
- for screenshots, PDFs, and other binaries, the diff may only show that the file changed
- when a binary file is staged, open it manually and confirm it is sanitized before commit

Simple example:

```diff
diff --git a/projects/01-vps-hardening/README.md b/projects/01-vps-hardening/README.md
--- a/projects/01-vps-hardening/README.md
+++ b/projects/01-vps-hardening/README.md
@@ -10,2 +10,2 @@
-Server IP: 143.10.10.10
+Server IP: 192.0.2.10
```

How to read that example:

- the file `projects/01-vps-hardening/README.md` changed
- the line with `-` is what is being removed
- the line with `+` is what is being added
- this is a good change because a real-looking IP was replaced with a safe example IP

Commit message guidance:

- `chore`
  - use for repo structure or maintenance changes
- `docs`
  - use for README, publishing notes, sanitization notes, and case-study writing
- `feat`
  - use when a new reusable capability or substantive project asset is being added

Recommended commit pattern:

- `chore: initialize sanitized source case study template`
- `docs: add sanitized vps hardening case study`
- `docs: add sanitized network incident playbook`
- `feat: add connection diagnosis script with redacted evidence`
- `docs: refine sanitization and evidence guidance`

## 8. Final release use
After push, use the repository as:

- a private technical source repository
- a FolioVista Books source asset
- a basis for practical guides, field books, or sample chapters

Do not treat private storage as the end of review. Re-check sanitization every time repo material is turned into external publication content.
