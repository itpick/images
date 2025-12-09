{ buildCLIImage, pkgs, lib, ... }:

# Image: nfpm
# Reference: https://images.chainguard.dev/directory/image/nfpm/overview

# Packages available in nixpkgs:
#   pkgs.nfpm  # nfpm (2.44.0-r0)

# TODO: Implement nfpm image
throw "Image 'nfpm' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.nfpm;
#   name = "nfpm";
#   tag = "v${pkgs.nfpm.version}";
#   entrypoint = [ "${pkgs.nfpm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nfpm";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
