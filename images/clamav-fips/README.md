# clamav-fips

ClamAV® is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clamav-fips

# Load into Docker
nix build .#load-clamav-fips-to-docker && ./result/bin/load-clamav-fips-to-docker
```
