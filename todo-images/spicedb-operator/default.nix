{ buildCLIImage, pkgs, lib, ... }:

# Image: spicedb-operator
# Reference: https://images.chainguard.dev/directory/image/spicedb-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   spicedb-operator (1.21.0-r2)

# TODO: Implement spicedb-operator image
throw "Image 'spicedb-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "spicedb-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "spicedb-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
