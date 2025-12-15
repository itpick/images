# gpg-fips-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpg-fips-agent

# Load into Docker
nix build .#load-gpg-fips-agent-to-docker && ./result/bin/load-gpg-fips-agent-to-docker
```
