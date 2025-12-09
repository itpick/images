{ buildCLIImage, pkgs, lib, ... }:

# Image: conda
# Reference: https://images.chainguard.dev/directory/image/conda/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libarchive  # libarchive (3.8.4-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmamba  # libmamba (2.4.0-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libsolv  # libsolv (0.7.35-r0)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.reproc  # reproc (14.2.5-r5)
#   pkgs.simdjson  # simdjson (4.2.2-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-cpp  # yaml-cpp (0.8.0-r10)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   conda-base (25.11.0-r0)
#   conda-init (25.11.0-r0)
#   conda-wrapper (25.11.0-r0)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfmt12 (12.1.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.12-archspec (0.2.5-r4)
#   py3.12-boltons (25.0.0-r1)
#   py3.12-certifi (2025.11.12-r0)
#   py3.12-cffi (2.0.0-r0)
#   py3.12-charset-normalizer (3.4.4-r2)
#   py3.12-colorama (0.4.6-r10)
#   py3.12-conda (25.11.0-r0)
#   py3.12-conda-bin (25.11.0-r0)
#   py3.12-conda-libmamba-solver (25.11.0-r0)
#   py3.12-conda-package-handling (2.4.0-r4)
#   py3.12-conda-package-streaming (0.12.0-r3)
#   py3.12-frozendict (2.4.7-r0)
#   py3.12-idna (3.11-r0)
#   py3.12-libmambapy (2.4.0-r0)
#   py3.12-msgpack (1.1.2-r0)
#   py3.12-packaging (25.0-r2)
#   py3.12-platformdirs (4.5.0-r0)
#   py3.12-pluggy (1.6.0-r2)
#   py3.12-pycosat (0.6.6-r3)
#   py3.12-pycparser (2.23-r0)
#   py3.12-pyparsing (3.2.5-r0)
#   py3.12-requests (2.32.5-r0)
#   py3.12-ruamel-yaml (0.18.16-r0)
#   py3.12-tqdm (4.67.1-r3)
#   py3.12-urllib3 (2.5.0-r2)
#   py3.12-zstandard (0.25.0-r0)
#   python-3.12-base (3.12.12-r2)
#   reproc++ (14.2.5-r5)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement conda image
throw "Image 'conda' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "conda";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "conda";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
