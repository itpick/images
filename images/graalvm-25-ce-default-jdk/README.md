# graalvm-25-ce-default-jdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#graalvm-25-ce-default-jdk

# Load into Docker
nix build .#load-graalvm-25-ce-default-jdk-to-docker && ./result/bin/load-graalvm-25-ce-default-jdk-to-docker
```
