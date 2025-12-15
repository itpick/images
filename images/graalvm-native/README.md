# graalvm-native

Base image with just enough files to run native GraalVM native-image binaries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#graalvm-native

# Load into Docker
nix build .#load-graalvm-native-to-docker && ./result/bin/load-graalvm-native-to-docker
```
