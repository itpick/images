{ buildCLIImage, pkgs, lib, ... }:

# Image: net-kourier
# Reference: https://images.chainguard.dev/directory/image/net-kourier/overview

# Packages NOT in nixpkgs (need custom derivations):
#   net-kourier-1.19 (1.19.6-r1)

# TODO: Implement net-kourier image
throw "Image 'net-kourier' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "net-kourier";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "net-kourier";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
