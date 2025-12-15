# corretto-21-default-jvm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#corretto-21-default-jvm

# Load into Docker
nix build .#load-corretto-21-default-jvm-to-docker && ./result/bin/load-corretto-21-default-jvm-to-docker
```
