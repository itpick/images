# deck-fips

deck is a command-line interface for managing Kong Gateway configurations declaratively

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#deck-fips

# Load into Docker
nix build .#load-deck-fips-to-docker && ./result/bin/load-deck-fips-to-docker
```
