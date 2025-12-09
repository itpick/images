{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-iamguarded
# Reference: https://images.chainguard.dev/directory/image/thanos-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.thanos  # thanos (0.40.1-r2)

# TODO: Implement thanos-iamguarded image
throw "Image 'thanos-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.thanos;
#   name = "thanos-iamguarded";
#   tag = "v${pkgs.thanos.version}";
#   entrypoint = [ "${pkgs.thanos}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
