{ buildCLIImage, pkgs, lib, ... }:

# Image: opensearch-dashboards-fips
# Reference: https://images.chainguard.dev/directory/image/opensearch-dashboards-fips/overview

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
#   opensearch-dashboards-3-fips (3.2.0-r2)
#   opensearch-dashboards-3-fips-alerting-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-fips-anomaly-detection-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-fips-config (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-maps (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-notifications (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-observability (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-query-workbench (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-reporting (3.2.0-r2)
#   opensearch-dashboards-3-fips-dashboards-search-relevance (3.2.0-r2)
#   opensearch-dashboards-3-fips-ml-commons-dashboards (3.2.0-r2)
#   opensearch-dashboards-3-fips-security-analytics-dashboards-plugin (3.2.0-r2)
#   opensearch-dashboards-3-fips-security-dashboards-plugin (3.2.0-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement opensearch-dashboards-fips image
throw "Image 'opensearch-dashboards-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "opensearch-dashboards-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "opensearch-dashboards-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
