# mailpit

Mailpit is an email and SMTP testing tool with API for developers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mailpit

# Load into Docker
nix build .#load-mailpit-to-docker && ./result/bin/load-mailpit-to-docker
```
