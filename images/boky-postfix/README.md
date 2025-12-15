# boky-postfix

boky-postfix is an open-source Mail Transfer Agent that reliably sends and receives email. With Rspamd integration, it uses Rspamd’s built-in DKIM signing module to cryptographically sign outgoing emails, simplifying mail authentication and improving deliverability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#boky-postfix

# Load into Docker
nix build .#load-boky-postfix-to-docker && ./result/bin/load-boky-postfix-to-docker
```
