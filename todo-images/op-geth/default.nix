{ buildCLIImage, pkgs, lib, ... }:

# Image: op-geth
# Reference: https://images.chainguard.dev/directory/image/op-geth/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.op-geth  # op-geth (1.101603.5-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement op-geth image
throw "Image 'op-geth' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.op-geth;
#   name = "op-geth";
#   tag = "v${pkgs.op-geth.version}";
#   entrypoint = [ "${pkgs.op-geth}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "op-geth";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
