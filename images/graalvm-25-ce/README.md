# graalvm-25-ce

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#graalvm-25-ce

# Load into Docker
nix build .#load-graalvm-25-ce-to-docker && ./result/bin/load-graalvm-25-ce-to-docker
```
