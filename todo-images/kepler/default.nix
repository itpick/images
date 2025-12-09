{ buildCLIImage, pkgs, lib, ... }:

# Image: kepler
# Reference: https://images.chainguard.dev/directory/image/kepler/overview

# Packages available in nixpkgs:
#   pkgs.kepler  # kepler (0.11.3-r1)

# TODO: Implement kepler image
throw "Image 'kepler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kepler;
#   name = "kepler";
#   tag = "v${pkgs.kepler.version}";
#   entrypoint = [ "${pkgs.kepler}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kepler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
