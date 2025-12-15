# promitor-agent-scraper-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promitor-agent-scraper-fips

# Load into Docker
nix build .#load-promitor-agent-scraper-fips-to-docker && ./result/bin/load-promitor-agent-scraper-fips-to-docker
```
