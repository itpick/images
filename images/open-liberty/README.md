# open-liberty

Open Liberty is a highly composable, fast to start, dynamic application server runtime environment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#open-liberty

# Load into Docker
nix build .#load-open-liberty-to-docker && ./result/bin/load-open-liberty-to-docker
```
