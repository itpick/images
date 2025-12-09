{ buildCLIImage, pkgs, lib, ... }:

# Image: openresty
# Reference: https://images.chainguard.dev/directory/image/openresty/overview

# Packages available in nixpkgs:
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gd  # gd (2.3.3-r12)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libavif  # libavif (1.3.0-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libice  # libice (1.1.2-r2)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
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
#   pkgs.openresty  # openresty (1.27.1.2-r3)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pcre  # pcre (8.45-r7)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   fontconfig-config (2.17.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libdav1d (1.5.2-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgd (2.3.3-r12)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   tiff (4.7.1-r0)

# TODO: Implement openresty image
throw "Image 'openresty' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.openresty;
#   name = "openresty";
#   tag = "v${pkgs.openresty.version}";
#   entrypoint = [ "${pkgs.openresty}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "openresty";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
