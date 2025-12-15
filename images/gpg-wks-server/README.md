# gpg-wks-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpg-wks-server

# Load into Docker
nix build .#load-gpg-wks-server-to-docker && ./result/bin/load-gpg-wks-server-to-docker
```
