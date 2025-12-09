{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-vmalert
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-vmalert/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   victoriametrics-vmalert-cluster (1.131.0-r1)

# TODO: Implement victoriametrics-vmalert image
throw "Image 'victoriametrics-vmalert' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "victoriametrics-vmalert";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-vmalert";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
