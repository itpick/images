{ buildCLIImage, pkgs, lib, ... }:

# Image: syft
# Reference: https://images.chainguard.dev/directory/image/syft/overview

# Packages available in nixpkgs:
#   pkgs.syft  # syft (1.38.0-r2)

# TODO: Implement syft image
throw "Image 'syft' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.syft;
#   name = "syft";
#   tag = "v${pkgs.syft.version}";
#   entrypoint = [ "${pkgs.syft}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "syft";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
