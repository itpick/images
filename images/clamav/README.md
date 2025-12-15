# clamav

ClamAV® is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#clamav

# Load into Docker
nix build .#load-clamav-to-docker && ./result/bin/load-clamav-to-docker
```
