# Binary_Secret_Hunter
Binary Secret Hunter is a lightweight Bash-based static analysis tool designed to extract hardcoded secrets, credentials, and sensitive artifacts from compiled binaries such as .exe, .dll, .elf, and other executable files.


**Why Binary Secret Hunter?**

In real-world environments, developers often embed:

API keys
Database credentials
Authentication tokens
Private key references
Internal URLs and email addresses

inside compiled binaries.

These artifacts can lead to:

Account Takeover (ATO)
Database compromise
Cloud resource abuse
Lateral movement in enterprise networks

Binary Secret Hunter provides a fast, automated first-level inspection before deeper reverse-engineering with tools like Ghidra or IDA.

****** Features******
**Credential & Secret Discovery**

Detects common indicators of sensitive data including:

Passwords, passphrases, secrets
API keys, access keys, bearer tokens
JWTs and OAuth tokens
Database usernames and passwords
Connection strings
Cryptographic artifacts (salt, IV, nonce, HMAC)
**Embedded Credential URLs**
Identifies URLs containing user:password@host patterns
**Email Address Enumeration**
Extracts embedded developer or service email addresses
**Identifier & Token Detection**
GUID / UUID values
Long hexadecimal strings (hashes, keys, tokens)
Long alphanumeric secrets (≥32 characters)
**Sensitive File & Key References**

Detects references to:

Configuration files: .config, .conf, .ini, .env
Key material: .pem, .key, .crt, .cer
Certificate stores: .pfx, .p12
Data files: .db, .sql, .mdf, .ldf
Structured data: .json, .xml

Supports both Linux and Windows file path formats.

****Use Cases****
Thick Client Security Testing (EXE / MSI)
Application Security (AppSec) reviews
Red Team reconnaissance
Malware & forensic analysis
CI/CD binary security validation
Hardcoded secret detection before release
**Requirements**
Bash (Linux/macOS)

strings (binutils)

grep

sort

Tested on Kali Linux and standard Linux distributions.

**Installation**
git clone https://github.com/pwnpilot/binary-secret-hunter.git

cd binary-secret-hunter

chmod +x binary_secret_hunter.sh

**Usage**

./binary_secret_hunter.sh target_binary.exe

Example Targets

./binary_secret_hunter.sh app.exe

./binary_secret_hunter.sh agent.dll

./binary_secret_hunter.sh client.elf

**Output**

The tool outputs categorized results including:

Credential-related strings
URLs with embedded credentials
Email addresses
GUIDs and identifiers
Long tokens and hashes
Referenced config and key files

Results are deduplicated and sorted for clarity.

**Limitations**

This is a static string-based analysis tool

Obfuscated, encrypted, or runtime-generated secrets may not be detected

False positives may occur and require analyst validation

For deeper inspection, combine with:

Ghidra

IDA Pro

x64dbg

ProcMon / API monitoring

**Legal Disclaimer**

This tool is intended only for educational purposes and authorized security testing.

Do not use this tool on binaries or systems you do not own or have explicit permission to analyze.

The author assumes no responsibility for misuse.
