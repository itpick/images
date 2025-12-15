# selenium-standalone-firefox

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#selenium-standalone-firefox

# Load into Docker
nix build .#load-selenium-standalone-firefox-to-docker && ./result/bin/load-selenium-standalone-firefox-to-docker
```
