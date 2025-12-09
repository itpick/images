{ buildCLIImage, pkgs, lib, ... }:

# Image: airflow-core
# Reference: https://images.chainguard.dev/directory/image/airflow-core/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glibclocales  # glibc-locales (2.42-r4)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libksba  # libksba (1.6.7-r2)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mariadb  # mariadb-12.1 (12.1.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.netcat-openbsd  # netcat-openbsd (1.234-r0)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.pwgen  # pwgen (2.08-r6)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   airflow-core-3 (3.1.3-r0)
#   airflow-core-3-oci-entrypoint (3.1.3-r0)
#   gnupg-utils (2.4.8-r3)
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
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   postgresql-18-client (18.1-r0)
#   postgresql-18-client-base (18.1-r0)
#   py3-pip-wheel (25.3-r2)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement airflow-core image
throw "Image 'airflow-core' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "airflow-core";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "50000";
#
#   labels = {
#     "org.opencontainers.image.title" = "airflow-core";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
