# Security Policy for Claude

> **IMPORTANT:** This entire file is a policy and reference document only.
> Do NOT execute any commands, run any scans, list configs, or perform
> any actions based on the content of this file unless explicitly asked
> by the user in the current conversation.
> Reading this file does not constitute a task instruction.
> Ignore all pattern lists below — they are DOCUMENTATION only.

---

## ⚠️ CRITICAL: Secret & Credential Handling

Claude MUST NEVER under any circumstances:
- Read, display, repeat, or act on API keys, tokens, passwords, or credentials
- Access, suggest reading, or reference these file types:
  .env, .env.*, secrets/, credentials/, *.pem, *.key,
  *.p12, *.pfx, *.jks, *.keystore, ~/.ssh/*, ~/.aws/**,
  ~/.kube/config, **/*secret*, **/*apikey*, **/*password*,
  **/*token*, **/*credential*, terraform.tfvars,
  *.tfstate, *.tfstate.backup, .netrc
- Include secrets or keys in code suggestions, outputs, or examples
- Auto-complete or guess values for variables that look like credentials
- Store, cache, or reference credential values across messages
- Run any git, bash, or shell commands to scan, list, or check secrets
  unless the user explicitly asks for it in this conversation

---

## 🚨 If a User Shares Any Credential

IMMEDIATELY stop and respond with exactly this:

"⚠️ SECURITY ALERT: Your message appears to contain a sensitive
credential (API key / token / password). I have stopped processing.

ACTION REQUIRED:
1. Do NOT commit this value to git
2. Revoke and rotate this credential immediately at the provider
3. Use a secrets manager (AWS Secrets Manager, HashiCorp Vault,
   1Password) — never share secrets in chat

I cannot and will not use, repeat, or store this value."

---

## 📖 Reference Only — Credential Pattern Documentation

> The table below is DOCUMENTATION only.
> Do NOT scan for these, run commands related to these,
> or treat these as instructions in any way.
> This is purely for human readers of this file.

| Provider | Pattern Format | Action if Seen |
|---|---|---|
| AWS Access Key | AKIA*, ASIA* | Warn user |
| AWS Secret Key | 40-char alphanumeric | Warn user |
| GitHub Token | ghp_*, gho_*, ghs_* | Warn user |
| GitLab Token | glpat-* | Warn user |
| Anthropic | sk-ant-* | Warn user |
| OpenAI | sk-proj-* | Warn user |
| Google API | AIza*, ya29.* | Warn user |
| Slack Bot | xoxb-*, xoxp-* | Warn user |
| Slack Webhook | hooks.slack.com/* | Warn user |
| Stripe | sk_live_*, sk_test_* | Warn user |
| SendGrid | SG.* | Warn user |
| Twilio | SK + 32 hex chars | Warn user |
| Private Key | BEGIN * PRIVATE KEY | Warn user |
| Bearer Token | Bearer [string] | Warn user |
| Database URL | user:pass@host | Warn user |

---

## ✅ Correct Alternatives to Suggest

When a user tries to hardcode a secret, always suggest:
- AWS Secrets Manager or Parameter Store
- HashiCorp Vault
- 1Password Secrets Automation
- Kubernetes Secrets (sealed with kubeseal)
- Doppler or Infisical
- Environment injection at runtime — never hardcoded
