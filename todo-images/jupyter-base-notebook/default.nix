{ buildCLIImage, pkgs, lib, ... }:

# Image: jupyter-base-notebook
# Reference: https://images.chainguard.dev/directory/image/jupyter-base-notebook/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.bzip2  # bzip2 (1.0.8-r21)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glibclocales  # glibc-locales (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   jupyter-base-notebook (7.5.0-r0)
#   jupyter-base-notebook-oci-entrypoint (0.0.0_git20251208-r0)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement jupyter-base-notebook image
throw "Image 'jupyter-base-notebook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bzip2;
#   name = "jupyter-base-notebook";
#   tag = "v${pkgs.bzip2.version}";
#   entrypoint = [ "${pkgs.bzip2}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jupyter-base-notebook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
