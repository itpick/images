{ buildCLIImage, pkgs, lib, ... }:

# Image: google-cloud-sdk-iamguarded
# Reference: https://images.chainguard.dev/directory/image/google-cloud-sdk-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.google-cloud-sdk  # google-cloud-sdk (548.0.0-r0)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r1)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   gke-gcloud-auth-plugin (0.1.0-r11)
#   google-cloud-sdk-core (548.0.0-r0)
#   kubectl-1.34-default (1.34.2-r1)
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
#   py3.11-crcmod (1.7-r8)
#   py3.11-google-cloud-sdk (543.0.0-r0)
#   py3.13-crcmod (1.7-r8)
#   py3.13-google-cloud-sdk (548.0.0-r0)
#   python-3.11-base (3.11.14-r3)
#   python-3.13-base (3.13.10-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement google-cloud-sdk-iamguarded image
throw "Image 'google-cloud-sdk-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "google-cloud-sdk-iamguarded";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "google-cloud-sdk-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
