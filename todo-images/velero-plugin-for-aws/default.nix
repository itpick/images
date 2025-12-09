{ buildCLIImage, pkgs, lib, ... }:

# Image: velero-plugin-for-aws
# Reference: https://images.chainguard.dev/directory/image/velero-plugin-for-aws/overview

# Packages NOT in nixpkgs (need custom derivations):
#   velero-plugin-for-aws (1.13.1-r1)

# TODO: Implement velero-plugin-for-aws image
throw "Image 'velero-plugin-for-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "velero-plugin-for-aws";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "velero-plugin-for-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
