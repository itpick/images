{ buildCLIImage, pkgs, lib, ... }:

# Image: k8ssandra-client
# Reference: https://images.chainguard.dev/directory/image/k8ssandra-client/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   k8ssandra-client (0.8.4-r2)
#   ld-linux (2.42-r4)

# TODO: Implement k8ssandra-client image
throw "Image 'k8ssandra-client' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "k8ssandra-client";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8ssandra-client";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
