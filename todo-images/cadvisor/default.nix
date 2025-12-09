{ buildCLIImage, pkgs, lib, ... }:

# Image: cadvisor
# Reference: https://images.chainguard.dev/directory/image/cadvisor/overview

# Packages available in nixpkgs:
#   pkgs.cadvisor  # cadvisor (0.54.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cadvisor image
throw "Image 'cadvisor' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cadvisor;
#   name = "cadvisor";
#   tag = "v${pkgs.cadvisor.version}";
#   entrypoint = [ "${pkgs.cadvisor}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cadvisor";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
