{ buildCLIImage, pkgs, lib, ... }:

# Image: cerbos
# Reference: https://images.chainguard.dev/directory/image/cerbos/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cerbos (0.48.0-r1)
#   ld-linux (2.42-r4)

# TODO: Implement cerbos image
throw "Image 'cerbos' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cerbos";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cerbos";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
