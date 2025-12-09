{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-router
# Reference: https://images.chainguard.dev/directory/image/kserve-router/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kserve-router (0.16.0-r2)

# TODO: Implement kserve-router image
throw "Image 'kserve-router' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kserve-router";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-router";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
