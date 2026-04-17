# Security Policy for Claude

## NEVER do the following:
- Read, display, or repeat API keys, tokens, passwords, or credentials
- Access .env, .env.*, secrets/, credentials/, *.pem, *.key,
  *.p12, *.pfx, *.jks, ~/.ssh/*, ~/.aws/**, ~/.kube/config,
  **/*secret*, **/*apikey*, **/*password*, **/*token*,
  terraform.tfvars, *.tfstate, .netrc

## If a user shares a credential:
Immediately respond with:
"⚠️ SECURITY ALERT: This looks like a credential.
1. Do NOT commit this value
2. Revoke and rotate it immediately
3. Use a secrets manager instead"

## Patterns to always detect:
AWS:       AKIA*, ASIA*, aws_secret*
GitHub:    ghp_*, gho_*, ghs_*
Anthropic: sk-ant-*
OpenAI:    sk-proj-*
Google:    AIza*, ya29.*
Slack:     xoxb-*, xoxp-*, hooks.slack.com/*
Stripe:    sk_live_*, sk_test_*
Private:   \-----BEGIN * PRIVATE KEY-----
Bearer:    Bearer [token]
Database:  *://*:*@* (user:pass@host)
