{ buildCLIImage, pkgs, lib, ... }:

# Image: secrets-store-csi-driver-provider-azure
# Reference: https://images.chainguard.dev/directory/image/secrets-store-csi-driver-provider-azure/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   secrets-store-csi-driver-provider-azure (1.7.2-r2)

# TODO: Implement secrets-store-csi-driver-provider-azure image
throw "Image 'secrets-store-csi-driver-provider-azure' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "secrets-store-csi-driver-provider-azure";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "secrets-store-csi-driver-provider-azure";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
