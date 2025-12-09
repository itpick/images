{ buildCLIImage, pkgs, lib, ... }:

# Image: apache-apisix
# Reference: https://images.chainguard.dev/directory/image/apache-apisix/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.brotli  # brotli (1.2.0-r1)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gd  # gd (2.3.3-r12)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libavif  # libavif (1.3.0-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libice  # libice (1.1.2-r2)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsm  # libsm (1.2.6-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxpm  # libxpm (3.5.17-r6)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.libxt  # libxt (1.3.1-r2)
#   pkgs.luajit  # luajit (2.1_p20250117-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pcre  # pcre (8.45-r7)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   apache-apisix (3.14.1-r33)
#   bash-binsh (5.3-r3)
#   brotli-dev (1.2.0-r1)
#   fontconfig-config (2.17.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libdav1d (1.5.2-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgd (2.3.3-r12)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libwasmtime (39.0.1-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   tiff (4.7.1-r0)

# TODO: Implement apache-apisix image
throw "Image 'apache-apisix' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.brotli;
#   name = "apache-apisix";
#   tag = "v${pkgs.brotli.version}";
#   entrypoint = [ "${pkgs.brotli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "636";
#
#   labels = {
#     "org.opencontainers.image.title" = "apache-apisix";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
