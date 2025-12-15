# trufflehog

TruffleHog is a tool that allows you to discover, classify, validate, and analyze leaked credentials

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#trufflehog

# Load into Docker
nix build .#load-trufflehog-to-docker && ./result/bin/load-trufflehog-to-docker
```
