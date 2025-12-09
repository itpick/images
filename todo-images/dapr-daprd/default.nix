{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-daprd
# Reference: https://images.chainguard.dev/directory/image/dapr-daprd/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   dapr-daprd-1.15 (1.15.13-r3)
#   ld-linux (2.42-r4)

# TODO: Implement dapr-daprd image
throw "Image 'dapr-daprd' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "dapr-daprd";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-daprd";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
