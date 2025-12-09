{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-typha
# Reference: https://images.chainguard.dev/directory/image/calico-typha/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-typhad-3.31 (3.31.2-r3)
#   ld-linux (2.42-r4)

# TODO: Implement calico-typha image
throw "Image 'calico-typha' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "calico-typha";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-typha";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
