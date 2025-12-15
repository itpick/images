# rsyslog

rsyslog is a software utility used for log processing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rsyslog

# Load into Docker
nix build .#load-rsyslog-to-docker && ./result/bin/load-rsyslog-to-docker
```
