{ buildCLIImage, pkgs, lib, ... }:

# Image: airflow-iamguarded
# Reference: https://images.chainguard.dev/directory/image/airflow-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.apache-airflow  # airflow-2 (2.11.0-r15)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mariadb-connector-c  # mariadb-connector-c (3.4.8-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.netcat-openbsd  # netcat-openbsd (1.234-r0)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.unixodbc  # unixodbc (2.3.14-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   eudev-libs (3.2.14-r42)
#   ini-file (1.4.9-r3)
#   keyutils-libs (1.6.3-r37)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libltdl (2.5.4-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   py3-pip-wheel (25.3-r2)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)
#   wait-for-port (1.0.10-r3)

# TODO: Implement airflow-iamguarded image
throw "Image 'airflow-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.apache-airflow;
#   name = "airflow-iamguarded";
#   tag = "v${pkgs.apache-airflow.version}";
#   entrypoint = [ "${pkgs.apache-airflow}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "airflow-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
