{ buildCLIImage, pkgs, lib, ... }:

# Image: omni
# Reference: https://images.chainguard.dev/directory/image/omni/overview

# Packages available in nixpkgs:
#   pkgs.omni-gtk-theme  # omni (1.3.4-r0)
#   pkgs.omnictl  # omnictl (1.3.4-r0)

# TODO: Implement omni image
throw "Image 'omni' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.omni-gtk-theme;
#   name = "omni";
#   tag = "v${pkgs.omni-gtk-theme.version}";
#   entrypoint = [ "${pkgs.omni-gtk-theme}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "omni";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
