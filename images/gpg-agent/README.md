# gpg-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpg-agent

# Load into Docker
nix build .#load-gpg-agent-to-docker && ./result/bin/load-gpg-agent-to-docker
```
