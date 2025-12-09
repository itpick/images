{ buildCLIImage, pkgs, lib, ... }:

# Image: pgwatch
# Reference: https://images.chainguard.dev/directory/image/pgwatch/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   pgwatch (4.1.0-r1)

# TODO: Implement pgwatch image
throw "Image 'pgwatch' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "pgwatch";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pgwatch";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
