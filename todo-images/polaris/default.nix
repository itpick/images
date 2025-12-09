{ buildCLIImage, pkgs, lib, ... }:

# Image: polaris
# Reference: https://images.chainguard.dev/directory/image/polaris/overview

# Packages available in nixpkgs:
#   pkgs.polaris  # polaris (10.1.2-r1)

# TODO: Implement polaris image
throw "Image 'polaris' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.polaris;
#   name = "polaris";
#   tag = "v${pkgs.polaris.version}";
#   entrypoint = [ "${pkgs.polaris}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1200";
#
#   labels = {
#     "org.opencontainers.image.title" = "polaris";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
