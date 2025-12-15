# dnsdist-fips

dnsdist is a highly DNS-, DoS- and abuse-aware loadbalancer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dnsdist-fips

# Load into Docker
nix build .#load-dnsdist-fips-to-docker && ./result/bin/load-dnsdist-fips-to-docker
```
