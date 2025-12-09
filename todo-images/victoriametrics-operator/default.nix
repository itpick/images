{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-operator
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   victoriametrics-operator (0.66.0-r0)

# TODO: Implement victoriametrics-operator image
throw "Image 'victoriametrics-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "victoriametrics-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
