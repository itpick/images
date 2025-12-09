{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-otel
# Reference: https://images.chainguard.dev/directory/image/nginx-otel/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libavif  # libavif (1.3.0-r2)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libice  # libice (1.1.2-r2)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libsm  # libsm (1.2.6-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
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
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   docker-nginx (1.29.3-r0)
#   fontconfig-config (2.17.1-r1)
#   glibc-iconv (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libdav1d (1.5.2-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgd (2.3.3-r12)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nginx-mainline-config (1.29.3-r0)
#   nginx-mainline-mod-http_geoip (1.29.3-r0)
#   nginx-mainline-mod-http_image_filter (1.29.3-r0)
#   nginx-mainline-mod-http_xslt_filter (1.29.3-r0)
#   nginx-mainline-mod-stream_geoip (1.29.3-r0)
#   nginx-mainline-package-config (1.29.3-r0)
#   nginx-otel-mainline (0.1.2-r2)
#   njs (0.9.4-r1)
#   perl-dev (5.42.0-r1)
#   perl-utils (5.42.0-r1)
#   sqlite-libs (3.51.1-r0)
#   tiff (4.7.1-r0)

# TODO: Implement nginx-otel image
throw "Image 'nginx-otel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "nginx-otel";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-otel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
