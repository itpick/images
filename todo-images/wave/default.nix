{ buildCLIImage, pkgs, lib, ... }:

# Image: wave
# Reference: https://images.chainguard.dev/directory/image/wave/overview

# Packages NOT in nixpkgs (need custom derivations):
#   wave (0.10.0-r13)

# TODO: Implement wave image
throw "Image 'wave' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "wave";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "wave";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
