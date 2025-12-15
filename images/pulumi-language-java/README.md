# pulumi-language-java

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-java

# Load into Docker
nix build .#load-pulumi-language-java-to-docker && ./result/bin/load-pulumi-language-java-to-docker
```
