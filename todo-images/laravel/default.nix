{ buildCLIImage, pkgs, lib, ... }:

# Image: laravel
# Reference: https://images.chainguard.dev/directory/image/laravel/overview

# Packages available in nixpkgs:
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.execline  # execline (2.9.7.0-r51)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libsodium  # libsodium (1.0.20-r2)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2 (2.15.1-r2)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.php  # php-8.5 (8.5.0-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.s6  # s6 (2.13.2.0-r51)
#   pkgs.skalibs  # skalibs (2.14.4.0-r51)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   php-8.5-config (8.5.0-r0)
#   php-8.5-ctype (8.5.0-r0)
#   php-8.5-ctype-config (8.5.0-r0)
#   php-8.5-curl (8.5.0-r0)
#   php-8.5-curl-config (8.5.0-r0)
#   php-8.5-dom (8.5.0-r0)
#   php-8.5-dom-config (8.5.0-r0)
#   php-8.5-fileinfo (8.5.0-r0)
#   php-8.5-fileinfo-config (8.5.0-r0)
#   php-8.5-fpm (8.5.0-r0)
#   php-8.5-fpm-config (8.5.0-r0)
#   php-8.5-iconv (8.5.0-r0)
#   php-8.5-iconv-config (8.5.0-r0)
#   php-8.5-mbstring (8.5.0-r0)
#   php-8.5-mbstring-config (8.5.0-r0)
#   php-8.5-mysqlnd (8.5.0-r0)
#   php-8.5-mysqlnd-config (8.5.0-r0)
#   php-8.5-openssl (8.5.0-r0)
#   php-8.5-openssl-config (8.5.0-r0)
#   php-8.5-pdo (8.5.0-r0)
#   php-8.5-pdo-config (8.5.0-r0)
#   php-8.5-pdo_mysql (8.5.0-r0)
#   php-8.5-pdo_mysql-config (8.5.0-r0)
#   php-8.5-pdo_sqlite (8.5.0-r0)
#   php-8.5-pdo_sqlite-config (8.5.0-r0)
#   php-8.5-phar (8.5.0-r0)
#   php-8.5-phar-config (8.5.0-r0)
#   php-8.5-simplexml (8.5.0-r0)
#   php-8.5-simplexml-config (8.5.0-r0)
#   php-8.5-sodium (8.5.0-r0)
#   php-8.5-sodium-config (8.5.0-r0)
#   php-8.5-xml (8.5.0-r0)
#   php-8.5-xml-config (8.5.0-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement laravel image
throw "Image 'laravel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "laravel";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "laravel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
