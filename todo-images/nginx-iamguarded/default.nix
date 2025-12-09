{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-iamguarded
# Reference: https://images.chainguard.dev/directory/image/nginx-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glibclocales  # glibc-locales (2.42-r4)
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
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pcre  # pcre (8.45-r7)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.su-exec  # su-exec (0.3-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   fontconfig-config (2.17.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
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
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nginx-iamguarded (1.29.3-r0)
#   perl-dev (5.42.0-r1)
#   perl-utils (5.42.0-r1)
#   posix-libc-utils (2.42-r4)
#   render-template (1.0.9-r2)
#   sed (4.9-r6)
#   tiff (4.7.1-r0)

# TODO: Implement nginx-iamguarded image
throw "Image 'nginx-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.freetype;
#   name = "nginx-iamguarded";
#   tag = "v${pkgs.freetype.version}";
#   entrypoint = [ "${pkgs.freetype}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
