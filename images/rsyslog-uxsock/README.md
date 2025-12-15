# rsyslog-uxsock

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rsyslog-uxsock

# Load into Docker
nix build .#load-rsyslog-uxsock-to-docker && ./result/bin/load-rsyslog-uxsock-to-docker
```
