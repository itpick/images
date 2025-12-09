{ buildCLIImage, pkgs, lib, ... }:

# Image: livekit-server
# Reference: https://images.chainguard.dev/directory/image/livekit-server/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   livekit-server (1.9.7-r0)

# TODO: Implement livekit-server image
throw "Image 'livekit-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "livekit-server";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "livekit-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
