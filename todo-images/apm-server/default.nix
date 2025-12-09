{ buildCLIImage, pkgs, lib, ... }:

# Image: apm-server
# Reference: https://images.chainguard.dev/directory/image/apm-server/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   apm-server-9.2 (9.2.2-r0)
#   ld-linux (2.42-r4)

# TODO: Implement apm-server image
throw "Image 'apm-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "apm-server";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "apm-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
