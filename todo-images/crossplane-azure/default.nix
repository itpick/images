{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-azure
# Reference: https://images.chainguard.dev/directory/image/crossplane-azure/overview

# Packages available in nixpkgs:
#   pkgs.terraform  # terraform-1.14 (1.14.1-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-azure (2.2.0-r3)
#   crossplane-provider-azure-family (2.2.0-r3)
#   terraform-provider-azurerm (4.55.0-r0)

# TODO: Implement crossplane-azure image
throw "Image 'crossplane-azure' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.terraform;
#   name = "crossplane-azure";
#   tag = "v${pkgs.terraform.version}";
#   entrypoint = [ "${pkgs.terraform}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-azure";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
