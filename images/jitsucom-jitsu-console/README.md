# jitsucom-jitsu-console

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jitsucom-jitsu-console

# Load into Docker
nix build .#load-jitsucom-jitsu-console-to-docker && ./result/bin/load-jitsucom-jitsu-console-to-docker
```
