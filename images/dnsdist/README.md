# dnsdist

dnsdist is a highly DNS-, DoS- and abuse-aware loadbalancer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dnsdist

# Load into Docker
nix build .#load-dnsdist-to-docker && ./result/bin/load-dnsdist-to-docker
```
