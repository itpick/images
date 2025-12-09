{ buildCLIImage, pkgs, lib, ... }:

# Image: docker-cli
# Reference: https://images.chainguard.dev/directory/image/docker-cli/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   docker-cli (29.1.2-r1)
#   ld-linux (2.42-r4)

# TODO: Implement docker-cli image
throw "Image 'docker-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "docker-cli";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "docker-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
