{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.prometheus  # prometheus-3.5 (3.5.0-r10)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement prometheus-iamguarded image
throw "Image 'prometheus-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
