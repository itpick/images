{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pipelines-metadata-writer
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pipelines-metadata-writer/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.10 (3.10.19-r3)
#   pkgs.re2  # re2 (2025.11.05-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   gmock (1.17.0-r3)
#   icu78-data-full (78.1-r0)
#   kubeflow-pipelines-metadata-writer (2.15.0-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   py3.10-absl-py (2.3.1-r2)
#   py3.10-attrs (25.4.0-r0)
#   py3.10-cachetools (6.2.2-r0)
#   py3.10-certifi (2025.11.12-r0)
#   py3.10-charset-normalizer (3.4.4-r2)
#   py3.10-durationpy (0.10-r2)
#   py3.10-frozenlist (1.8.0-r0)
#   py3.10-google-auth (2.43.0-r0)
#   py3.10-grpcio-1.76 (1.76.0-r2)
#   py3.10-idna (3.11-r0)
#   py3.10-importlib-metadata (8.7.0-r3)
#   py3.10-ipaddress (1.0.23-r5)
#   py3.10-kubernetes (34.1.0-r0)
#   py3.10-lru-dict (1.5.0-r0)
#   py3.10-ml-metadata (1.17.0-r3)
#   py3.10-oauthlib (3.3.1-r2)
#   py3.10-protobuf (6.33.2-r0)
#   py3.10-pyasn1 (0.6.1-r4)
#   py3.10-pyasn1-modules (0.4.2-r1)
#   py3.10-python-dateutil (2.9.0-r10)
#   py3.10-pyyaml (6.0.3-r0)
#   py3.10-requests (2.32.5-r0)
#   py3.10-requests-oauthlib (2.0.0-r4)
#   py3.10-rsa (4.9.1-r2)
#   py3.10-six (1.17.0-r2)
#   py3.10-typing-extensions (4.15.0-r0)
#   py3.10-urllib3 (2.5.0-r2)
#   py3.10-websocket-client (1.9.0-r0)
#   py3.10-zipp (3.23.0-r4)
#   python-3.10-base (3.10.19-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement kubeflow-pipelines-metadata-writer image
throw "Image 'kubeflow-pipelines-metadata-writer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "kubeflow-pipelines-metadata-writer";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pipelines-metadata-writer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
