{ buildCLIImage, pkgs, lib, ... }:

# Image: dfc
# Reference: https://images.chainguard.dev/directory/image/dfc/overview

# Packages available in nixpkgs:
#   pkgs.dfc  # dfc (0.9.5-r2)

# TODO: Implement dfc image
throw "Image 'dfc' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dfc;
#   name = "dfc";
#   tag = "v${pkgs.dfc.version}";
#   entrypoint = [ "${pkgs.dfc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dfc";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
