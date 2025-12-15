# trufflehog-fips

TruffleHog is a tool that allows you to discover, classify, validate, and analyze leaked credentials

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trufflehog-fips

# Load into Docker
nix build .#load-trufflehog-fips-to-docker && ./result/bin/load-trufflehog-fips-to-docker
```
