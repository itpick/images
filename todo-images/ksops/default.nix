{ buildCLIImage, pkgs, lib, ... }:

# Image: ksops
# Reference: https://images.chainguard.dev/directory/image/ksops/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kustomize  # kustomize (5.8.0-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ksops (4.4.0-r3)
#   ld-linux (2.42-r4)

# TODO: Implement ksops image
throw "Image 'ksops' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ksops";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ksops";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
