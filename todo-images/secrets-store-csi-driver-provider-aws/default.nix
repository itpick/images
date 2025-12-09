{ buildCLIImage, pkgs, lib, ... }:

# Image: secrets-store-csi-driver-provider-aws
# Reference: https://images.chainguard.dev/directory/image/secrets-store-csi-driver-provider-aws/overview

# Packages NOT in nixpkgs (need custom derivations):
#   secrets-store-csi-driver-provider-aws (2.1.1-r2)

# TODO: Implement secrets-store-csi-driver-provider-aws image
throw "Image 'secrets-store-csi-driver-provider-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "secrets-store-csi-driver-provider-aws";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "secrets-store-csi-driver-provider-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
