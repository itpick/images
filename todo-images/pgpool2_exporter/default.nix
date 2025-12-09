{ buildCLIImage, pkgs, lib, ... }:

# Image: pgpool2_exporter
# Reference: https://images.chainguard.dev/directory/image/pgpool2_exporter/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   pgpool2_exporter (1.2.2-r8)

# TODO: Implement pgpool2_exporter image
throw "Image 'pgpool2_exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "pgpool2_exporter";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pgpool2_exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
