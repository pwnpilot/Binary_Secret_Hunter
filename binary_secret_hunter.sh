#!/bin/bash
TARGET="$1"
if [[ -z "$TARGET" ]]; then echo "Usage: $0 <exe>"; exit 1; fi

echo "========= CREDENTIAL KEYWORDS ========="
strings "$TARGET" | grep -iE \
  "(password|passwd|pwd|secret|token|apikey|api.key|auth|bearer|jwt|access.key|secret.key|private.key|ssh.key|pem|rsa|dsa|credential|login|username|user_id|uid|passphrase|connectionString|connstr|dbpass|db_user|dbpassword|salt|iv|nonce|hmac)" \
  | sort -u

echo ""
echo "========= URLS WITH EMBEDDED CREDS ========="
strings "$TARGET" | grep -oiE "(https?://)[^\s/\"'<>]+@[^\s/\"'<>]+" | sort -u

echo ""
echo "========= EMAIL ADDRESSES ========="
strings "$TARGET" | grep -oiE "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" | sort -u

echo ""
echo "========= GUIDs ========="
strings "$TARGET" | grep -oiE "[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}" | sort -u

echo ""
echo "========= LONG HEX (>=32 chars) ========="
strings "$TARGET" | grep -oiE '[a-f0-9]{32,}' | sort -u

echo ""
echo "========= LONG ALPHANUMERIC (>=32 chars) ========="
strings "$TARGET" | grep -oiE '[A-Za-z0-9]{32,}' | sort -u

echo ""
echo "========= CONFIG FILES / KEYS REFERENCED ========="
strings "$TARGET" | grep -oiE "(/[\w./-]+\.(config|conf|ini|env|pem|key|crt|cer|pfx|p12|json|xml|sql|db|mdf|ldf)|[A-Z]:\\.+\.(config|conf|ini|env|pem|key|crt|cer|pfx|p12|json|xml|sql|db|mdf|ldf))" | sort -u