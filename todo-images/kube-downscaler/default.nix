{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-downscaler
# Reference: https://images.chainguard.dev/directory/image/kube-downscaler/overview

# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.13 (3.13.11-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-downscaler (23.2.0-r9)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.13-cachetools (6.2.2-r0)
#   py3.13-certifi (2025.11.12-r0)
#   py3.13-charset-normalizer (3.4.4-r2)
#   py3.13-google-auth (2.43.0-r0)
#   py3.13-idna (3.11-r0)
#   py3.13-oauthlib (3.3.1-r2)
#   py3.13-pyasn1 (0.6.1-r4)
#   py3.13-pyasn1-modules (0.4.2-r1)
#   py3.13-pykube-ng (23.6.0-r4)
#   py3.13-pytz (2025.2-r2)
#   py3.13-pyyaml (6.0.3-r0)
#   py3.13-requests (2.32.5-r0)
#   py3.13-requests-oauthlib (2.0.0-r4)
#   py3.13-rsa (4.9.1-r2)
#   py3.13-six (1.17.0-r2)
#   py3.13-urllib3 (2.5.0-r2)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement kube-downscaler image
throw "Image 'kube-downscaler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "kube-downscaler";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-downscaler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
