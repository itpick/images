# code-server-fips

VS Code in the browser

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#code-server-fips

# Load into Docker
nix build .#load-code-server-fips-to-docker && ./result/bin/load-code-server-fips-to-docker
```
