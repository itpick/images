{ buildCLIImage, pkgs, lib, ... }:

# Image: http-echo
# Reference: https://images.chainguard.dev/directory/image/http-echo/overview

# Packages NOT in nixpkgs (need custom derivations):
#   http-echo (1.0.0-r19)

# TODO: Implement http-echo image
throw "Image 'http-echo' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "http-echo";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "http-echo";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
