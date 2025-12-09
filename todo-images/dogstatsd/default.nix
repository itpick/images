{ buildCLIImage, pkgs, lib, ... }:

# Image: dogstatsd
# Reference: https://images.chainguard.dev/directory/image/dogstatsd/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.netcat-openbsd  # netcat-openbsd (1.234-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   dogstatsd (7.72.4-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement dogstatsd image
throw "Image 'dogstatsd' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "dogstatsd";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dogstatsd";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
