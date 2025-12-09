{ buildCLIImage, pkgs, lib, ... }:

# Image: plugin-barman-cloud-sidecar
# Reference: https://images.chainguard.dev/directory/image/plugin-barman-cloud-sidecar/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   barman-cloudnative-pg (3.16.2-r0)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   plugin-barman-cloud (0.9.0-r1)
#   plugin-barman-cloud-sidecar (0.9.0-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.12-psycopg2 (2.9.11-r0)
#   py3.12-setuptools (80.9.0-r4)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement plugin-barman-cloud-sidecar image
throw "Image 'plugin-barman-cloud-sidecar' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "plugin-barman-cloud-sidecar";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "26";
#
#   labels = {
#     "org.opencontainers.image.title" = "plugin-barman-cloud-sidecar";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
