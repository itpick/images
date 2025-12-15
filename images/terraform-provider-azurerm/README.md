# terraform-provider-azurerm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#terraform-provider-azurerm

# Load into Docker
nix build .#load-terraform-provider-azurerm-to-docker && ./result/bin/load-terraform-provider-azurerm-to-docker
```
