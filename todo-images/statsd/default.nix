{ buildCLIImage, pkgs, lib, ... }:

# Image: statsd
# Reference: https://images.chainguard.dev/directory/image/statsd/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-22 (22.21.1-r1)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.prometheus-statsd-exporter  # statsd (0.10.2-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement statsd image
throw "Image 'statsd' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-statsd-exporter;
#   name = "statsd";
#   tag = "v${pkgs.prometheus-statsd-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-statsd-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "statsd";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
