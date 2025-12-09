{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-server
# Reference: https://images.chainguard.dev/directory/image/spire-server/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.spire-server  # spire-server (1.13.3-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement spire-server image
throw "Image 'spire-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.spire-server;
#   name = "spire-server";
#   tag = "v${pkgs.spire-server.version}";
#   entrypoint = [ "${pkgs.spire-server}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
