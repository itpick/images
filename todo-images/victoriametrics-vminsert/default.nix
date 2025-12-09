{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-vminsert
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-vminsert/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   victoriametrics-vminsert-cluster (1.131.0-r1)

# TODO: Implement victoriametrics-vminsert image
throw "Image 'victoriametrics-vminsert' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "victoriametrics-vminsert";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-vminsert";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
