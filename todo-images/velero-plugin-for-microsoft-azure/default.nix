{ buildCLIImage, pkgs, lib, ... }:

# Image: velero-plugin-for-microsoft-azure
# Reference: https://images.chainguard.dev/directory/image/velero-plugin-for-microsoft-azure/overview

# Packages NOT in nixpkgs (need custom derivations):
#   velero-plugin-for-microsoft-azure (1.13.1-r2)

# TODO: Implement velero-plugin-for-microsoft-azure image
throw "Image 'velero-plugin-for-microsoft-azure' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "velero-plugin-for-microsoft-azure";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "velero-plugin-for-microsoft-azure";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
