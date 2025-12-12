# clamav

ClamAV® is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 431.16 MB |
| Uncompressed | ~1.05 GB |

## Usage

```bash
# Build the image
nix build .#clamav

# Load into Docker
nix build .#load-clamav-to-docker && ./result/bin/load-clamav-to-docker
```
