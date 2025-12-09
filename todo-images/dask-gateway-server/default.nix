{ buildCLIImage, pkgs, lib, ... }:

# Image: dask-gateway-server
# Reference: https://images.chainguard.dev/directory/image/dask-gateway-server/overview

# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dask-gateway-server (2025.4.0-r6)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-provider-legacy (3.6.0-r4)
#   py3-pip-wheel (25.3-r2)
#   py3.13-aiohappyeyeballs (2.6.1-r1)
#   py3.13-aiohttp (3.13.2-r0)
#   py3.13-aiosignal (1.4.0-r2)
#   py3.13-async-timeout (5.0.1-r0)
#   py3.13-attrs (25.4.0-r0)
#   py3.13-certifi (2025.11.12-r0)
#   py3.13-cffi (2.0.0-r0)
#   py3.13-colorama (0.4.6-r10)
#   py3.13-colorlog (6.10.1-r0)
#   py3.13-cryptography (46.0.3-r1)
#   py3.13-frozenlist (1.8.0-r0)
#   py3.13-idna (3.11-r0)
#   py3.13-importlib-metadata (8.7.0-r3)
#   py3.13-kubernetes-asyncio (33.3.0-r0)
#   py3.13-multidict (6.7.0-r0)
#   py3.13-propcache (0.4.1-r0)
#   py3.13-pycparser (2.23-r0)
#   py3.13-python-dateutil (2.9.0-r10)
#   py3.13-pyyaml (6.0.3-r0)
#   py3.13-setuptools (80.9.0-r4)
#   py3.13-six (1.17.0-r2)
#   py3.13-sqlalchemy (2.0.44-r0)
#   py3.13-traitlets (5.14.3-r3)
#   py3.13-typing-extensions (4.15.0-r0)
#   py3.13-urllib3 (2.5.0-r2)
#   py3.13-yarl (1.22.0-r0)
#   py3.13-zipp (3.23.0-r4)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement dask-gateway-server image
throw "Image 'dask-gateway-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "dask-gateway-server";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dask-gateway-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
