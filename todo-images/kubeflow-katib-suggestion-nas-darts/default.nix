{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib-suggestion-nas-darts
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib-suggestion-nas-darts/overview

# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.11 (3.11.14-r3)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   katib-suggestion-nas-darts (0.19.0-r2)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   py3.11-pip (25.3-r2)
#   py3.11-pip-base (25.3-r2)
#   py3.11-setuptools (80.9.0-r4)
#   python-3.11-base (3.11.14-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement kubeflow-katib-suggestion-nas-darts image
throw "Image 'kubeflow-katib-suggestion-nas-darts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "kubeflow-katib-suggestion-nas-darts";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib-suggestion-nas-darts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
