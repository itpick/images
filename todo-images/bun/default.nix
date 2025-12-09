{ buildCLIImage, pkgs, lib, ... }:

# Image: bun
# Reference: https://images.chainguard.dev/directory/image/bun/overview

# Packages available in nixpkgs:
#   pkgs.bun  # bun (1.3.3-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement bun image
throw "Image 'bun' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bun;
#   name = "bun";
#   tag = "v${pkgs.bun.version}";
#   entrypoint = [ "${pkgs.bun}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "bun";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
