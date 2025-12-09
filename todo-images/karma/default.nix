{ buildCLIImage, pkgs, lib, ... }:

# Image: karma
# Reference: https://images.chainguard.dev/directory/image/karma/overview

# Packages available in nixpkgs:
#   pkgs.karma  # karma (0.122-r0)

# TODO: Implement karma image
throw "Image 'karma' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.karma;
#   name = "karma";
#   tag = "v${pkgs.karma.version}";
#   entrypoint = [ "${pkgs.karma}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "karma";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
