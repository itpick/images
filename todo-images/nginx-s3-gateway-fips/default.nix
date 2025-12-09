{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-s3-gateway-fips
# Reference: https://images.chainguard.dev/directory/image/nginx-s3-gateway-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.lerc  # lerc (4.0.0-r3)
#   pkgs.libavif  # libavif (1.3.0-r2)
#   pkgs.libdeflate  # libdeflate (1.19-r3)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libice  # libice (1.1.2-r2)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
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
#   pkgs.lz4  # lz4 (1.10.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   dash-binsh (0.5.13-r2)
#   fontconfig-config (2.17.1-r1)
#   glibc-iconv (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
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
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nginx-mainline-config (1.29.3-r0)
#   nginx-mainline-mod-http_geoip (1.29.3-r0)
#   nginx-mainline-mod-http_image_filter (1.29.3-r0)
#   nginx-mainline-mod-http_xslt_filter (1.29.3-r0)
#   nginx-s3-gateway-oci-entrypoint (0_git20250605-r5)
#   nginx-s3-gateway-unprivileged (0_git20250605-r5)
#   njs (0.9.4-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   perl-dev (5.42.0-r1)
#   perl-utils (5.42.0-r1)
#   sqlite-libs (3.51.1-r0)
#   tiff (4.7.1-r0)

# TODO: Implement nginx-s3-gateway-fips image
throw "Image 'nginx-s3-gateway-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "nginx-s3-gateway-fips";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "101";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-s3-gateway-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
