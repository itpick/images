{ buildCLIImage, pkgs, lib, ... }:

# Image: pluto
# Reference: https://images.chainguard.dev/directory/image/pluto/overview

# Packages available in nixpkgs:
#   pkgs.pluto  # pluto (5.22.6-r0)

# TODO: Implement pluto image
throw "Image 'pluto' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.pluto;
#   name = "pluto";
#   tag = "v${pkgs.pluto.version}";
#   entrypoint = [ "${pkgs.pluto}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "pluto";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
