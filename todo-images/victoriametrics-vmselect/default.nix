{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-vmselect
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-vmselect/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   victoriametrics-vmselect-cluster (1.131.0-r1)

# TODO: Implement victoriametrics-vmselect image
throw "Image 'victoriametrics-vmselect' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "victoriametrics-vmselect";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-vmselect";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
