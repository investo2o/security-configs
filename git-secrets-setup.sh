#!/bin/bash
# Run once after cloning any repo

echo "🔐 Installing git-secrets..."
brew install git-secrets 2>/dev/null || true

git secrets --register-aws
git secrets --install -f

# Pull latest patterns from security-configs
PATTERNS_URL="https://raw.githubusercontent.com/YOUR-ORG/security-configs/main/git-secrets-patterns.txt"

git config --unset-all secrets.patterns 2>/dev/null || true

while IFS= read -r pattern || [[ -n "$pattern" ]]; do
  [[ "$pattern" =~ ^#.*$ || -z "$pattern" ]] && continue
  git secrets --add "$pattern" 2>/dev/null
done < <(curl -s $PATTERNS_URL)

echo "✅ Done — $(git secrets --list | wc -l | tr -d ' ') patterns loaded"
