{ buildCLIImage, pkgs, lib, ... }:

# Image: rke2-cloud-provider
# Reference: https://images.chainguard.dev/directory/image/rke2-cloud-provider/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   rke2-cloud-provider (1.34.2-r1)

# TODO: Implement rke2-cloud-provider image
throw "Image 'rke2-cloud-provider' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "rke2-cloud-provider";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rke2-cloud-provider";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
