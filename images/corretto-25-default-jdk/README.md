# corretto-25-default-jdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#corretto-25-default-jdk

# Load into Docker
nix build .#load-corretto-25-default-jdk-to-docker && ./result/bin/load-corretto-25-default-jdk-to-docker
```
