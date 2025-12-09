{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-modelmesh-runtime-adapter
# Reference: https://images.chainguard.dev/directory/image/kserve-modelmesh-runtime-adapter/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hdf5  # hdf5 (2.0.0-r0)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libaec  # libaec (1.1.4-r1)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.liblzf  # liblzf (3.6-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   hdf5-hl (2.0.0-r0)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsz (1.1.4-r1)
#   libtensorflow2 (2.20.0-r0)
#   modelmesh-runtime-adapter (0.12.0-r21)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.12-absl-py (2.3.1-r2)
#   py3.12-astunparse (1.6.3-r9)
#   py3.12-cachetools (6.2.2-r0)
#   py3.12-certifi (2025.11.12-r0)
#   py3.12-charset-normalizer (3.4.4-r2)
#   py3.12-flatbuffers (25.9.23-r0)
#   py3.12-gast (0.7.0-r0)
#   py3.12-google-auth (2.43.0-r0)
#   py3.12-google-auth-oauthlib (1.2.3-r0)
#   py3.12-google-pasta (0.2.0-r6)
#   py3.12-h5py (3.15.1-r1)
#   py3.12-idna (3.11-r0)
#   py3.12-importlib-metadata (8.7.0-r3)
#   py3.12-keras (3.12.0-r0)
#   py3.12-markdown-it-py (4.0.0-r0)
#   py3.12-mdurl (0.1.2-r7)
#   py3.12-ml-dtypes (0.5.4-r0)
#   py3.12-namex (0.1.0-r2)
#   py3.12-numpy-2.2 (2.2.6-r4)
#   py3.12-oauthlib (3.3.1-r2)
#   py3.12-opt-einsum (3.4.0-r8)
#   py3.12-optree (0.18.0-r0)
#   py3.12-packaging (25.0-r2)
#   py3.12-pip (25.3-r2)
#   py3.12-pip-base (25.3-r2)
#   py3.12-protobuf (6.33.2-r0)
#   py3.12-pyasn1 (0.6.1-r4)
#   py3.12-pyasn1-modules (0.4.2-r1)
#   py3.12-pybind11 (3.0.1-r0)
#   py3.12-pygments (2.19.2-r3)
#   py3.12-pyparsing (3.2.5-r0)
#   py3.12-requests (2.32.5-r0)
#   py3.12-requests-oauthlib (2.0.0-r4)
#   py3.12-rich (14.2.0-r0)
#   py3.12-rsa (4.9.1-r2)
#   py3.12-setuptools (80.9.0-r4)
#   py3.12-six (1.17.0-r2)
#   py3.12-tensorflow-core (2.20.0-r0)
#   py3.12-termcolor (3.2.0-r0)
#   py3.12-typing-extensions (4.15.0-r0)
#   py3.12-urllib3 (2.5.0-r2)
#   py3.12-wheel (0.46.1-r5)
#   py3.12-wrapt (2.0.1-r0)
#   py3.12-zipp (3.23.0-r4)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)
#   tensorflow-core (2.20.0-r0)

# TODO: Implement kserve-modelmesh-runtime-adapter image
throw "Image 'kserve-modelmesh-runtime-adapter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "kserve-modelmesh-runtime-adapter";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-modelmesh-runtime-adapter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
