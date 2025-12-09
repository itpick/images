{ buildCLIImage, pkgs, lib, ... }:

# Image: os-shell-iamguarded
# Reference: https://images.chainguard.dev/directory/image/os-shell-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.diffutils  # diffutils (3.12-r3)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.npth  # npth (1.8-r9)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.yq  # yq (4.49.2-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   dash-binsh (0.5.13-r2)
#   gpgv (2.4.8-r3)
#   heimdal-libs (7.8.0-r42)
#   ini-file (1.4.9-r3)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libfdisk (2.41.2-r2)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   os-shell-iamguarded (1.0.0-r2)
#   render-template (1.0.9-r2)
#   sed (4.9-r6)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)
#   wait-for-port (1.0.10-r3)

# TODO: Implement os-shell-iamguarded image
throw "Image 'os-shell-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "os-shell-iamguarded";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "os-shell-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
