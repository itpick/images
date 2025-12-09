{ buildCLIImage, pkgs, lib, ... }:

# Image: distribution
# Reference: https://images.chainguard.dev/directory/image/distribution/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.distribution  # distribution (3.0.0-r44)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement distribution image
throw "Image 'distribution' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.distribution;
#   name = "distribution";
#   tag = "v${pkgs.distribution.version}";
#   entrypoint = [ "${pkgs.distribution}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "distribution";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
