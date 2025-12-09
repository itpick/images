{ buildCLIImage, pkgs, lib, ... }:

# Image: opensearch-dashboards
# Reference: https://images.chainguard.dev/directory/image/opensearch-dashboards/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.font-misc-cyrillic  # font-misc-cyrillic (1.0.4-r3)
#   pkgs.fontconfig  # fontconfig (2.17.1-r1)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libfontenc  # libfontenc (1.1.8-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-18 (18.20.8-r5)
#   pkgs.nss  # nss (3.119-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   font-misc (1.1.3-r2)
#   fontconfig-config (2.17.1-r1)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libxfont (2.0.7-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   opensearch-dashboards-3 (3.2.0-r2)
#   opensearch-dashboards-3-alerting-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-anomaly-detection-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-config (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-maps (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-notifications (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-observability (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-query-workbench (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-reporting (3.2.0-r2)
#   opensearch-dashboards-3-dashboards-search-relevance (3.2.0-r2)
#   opensearch-dashboards-3-ml-commons-dashboards (3.2.0-r2)
#   opensearch-dashboards-3-security-analytics-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-security-dashboards-plugin (3.2.0-r2)

# TODO: Implement opensearch-dashboards image
throw "Image 'opensearch-dashboards' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "opensearch-dashboards";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "opensearch-dashboards";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
