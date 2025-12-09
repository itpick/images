{ buildCLIImage, pkgs, lib, ... }:

# Image: ntia-conformance-checker
# Reference: https://images.chainguard.dev/directory/image/ntia-conformance-checker/overview

# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.13-beartype (0.22.8-r0)
#   py3.13-boolean.py (5.0-r2)
#   py3.13-click (8.3.1-r0)
#   py3.13-colorama (0.4.6-r10)
#   py3.13-html5lib (1.1-r5)
#   py3.13-importlib-metadata (8.7.0-r3)
#   py3.13-isodate (0.7.2-r3)
#   py3.13-license-expression (30.4.4-r1)
#   py3.13-ntia-conformance-checker (4.1.2-r0)
#   py3.13-ntia-conformance-checker-bin (4.1.2-r0)
#   py3.13-ply (3.11_git20180215-r8)
#   py3.13-pyparsing (3.2.5-r0)
#   py3.13-pyyaml (6.0.3-r0)
#   py3.13-rdflib (7.5.0-r0)
#   py3.13-semantic-version (2.10.0-r9)
#   py3.13-six (1.17.0-r2)
#   py3.13-spdx-python-model (0.0.3-r0)
#   py3.13-spdx-tools (0.8.3-r4)
#   py3.13-typing-extensions (4.15.0-r0)
#   py3.13-uritools (5.0.0-r2)
#   py3.13-webencodings (0.5.1-r6)
#   py3.13-xmltodict (1.0.2-r0)
#   py3.13-zipp (3.23.0-r4)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement ntia-conformance-checker image
throw "Image 'ntia-conformance-checker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "ntia-conformance-checker";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ntia-conformance-checker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
