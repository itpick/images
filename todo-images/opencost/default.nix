{ buildCLIImage, pkgs, lib, ... }:

# Image: opencost
# Reference: https://images.chainguard.dev/directory/image/opencost/overview

# Packages NOT in nixpkgs (need custom derivations):
#   opencost (1.118.0-r2)

# TODO: Implement opencost image
throw "Image 'opencost' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opencost";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "opencost";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
