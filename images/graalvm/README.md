# graalvm

GraalVM is an advanced JDK with ahead-of-time Native Image compilation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#graalvm

# Load into Docker
nix build .#load-graalvm-to-docker && ./result/bin/load-graalvm-to-docker
```
