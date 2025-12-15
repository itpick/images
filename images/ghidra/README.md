# ghidra

Ghidra application image offering both GUI and headless modes of operation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ghidra

# Load into Docker
nix build .#load-ghidra-to-docker && ./result/bin/load-ghidra-to-docker
```
