{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-azure-storage
# Reference: https://images.chainguard.dev/directory/image/crossplane-azure-storage/overview

# Packages available in nixpkgs:
#   pkgs.terraform  # terraform-1.14 (1.14.1-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-azure (2.2.0-r3)
#   crossplane-provider-azure-storage (2.2.0-r3)
#   terraform-provider-azurerm (4.55.0-r0)

# TODO: Implement crossplane-azure-storage image
throw "Image 'crossplane-azure-storage' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.terraform;
#   name = "crossplane-azure-storage";
#   tag = "v${pkgs.terraform.version}";
#   entrypoint = [ "${pkgs.terraform}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-azure-storage";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
