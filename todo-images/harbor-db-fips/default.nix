{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-db-fips
# Reference: https://images.chainguard.dev/directory/image/harbor-db-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.bc  # bc (1.08.2-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-19 (19.1.7-r14)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.postgresql  # postgresql-15 (15.15-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ecpg-15 (15.15-r0)
#   harbor-fips-2.14-db (2.14.1-r0)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   postgresql-14-base (14.20-r0)
#   postgresql-14-client-base (14.20-r0)
#   postgresql-15-base (15.15-r0)
#   postgresql-15-client (15.15-r0)
#   postgresql-15-client-base (15.15-r0)
#   postgresql-15-contrib (15.15-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement harbor-db-fips image
throw "Image 'harbor-db-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bc;
#   name = "harbor-db-fips";
#   tag = "v${pkgs.bc.version}";
#   entrypoint = [ "${pkgs.bc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-db-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
