# wireshark

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wireshark

# Load into Docker
nix build .#load-wireshark-to-docker && ./result/bin/load-wireshark-to-docker
```
