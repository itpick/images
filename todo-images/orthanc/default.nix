{ buildCLIImage, pkgs, lib, ... }:

# Image: orthanc
# Reference: https://images.chainguard.dev/directory/image/orthanc/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.boost  # boost (1.88.0-r7)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dcmtk  # dcmtk (3.6.9-r1)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.jsoncpp  # jsoncpp (1.9.6-r3)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libllvm  # libllvm-19 (19.1.7-r14)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.orthanc  # orthanc (1.12.10-r0)
#   pkgs.postgresql  # postgresql-17 (17.7-r0)
#   pkgs.python  # python-3.13 (3.13.11-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ecpg-17 (17.7-r0)
#   gmock (1.17.0-r3)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libboost-filesystem (1.88.0-r7)
#   libboost-iostreams (1.88.0-r7)
#   libboost-thread (1.88.0-r7)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libprotobuf33.1.0 (33.1-r1)
#   libprotoc33.1.0 (33.1-r1)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   lua5.4-libs (5.4.8-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   orthanc-dicomweb (1.22-r0)
#   orthanc-explorer2 (1.10.1-r0)
#   orthanc-gdcm (1.8-r3)
#   orthanc-ohif (1.7-r1)
#   orthanc-postgresql (10.0-r0)
#   orthanc-python (7.0-r0)
#   postgresql-17-base (17.7-r0)
#   postgresql-17-client (17.7-r0)
#   postgresql-17-client-base (17.7-r0)
#   py3-pip-wheel (25.3-r2)
#   py3.13-envsubst (0.1.5-r1)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)
#   tiff (4.7.1-r0)

# TODO: Implement orthanc image
throw "Image 'orthanc' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.orthanc;
#   name = "orthanc";
#   tag = "v${pkgs.orthanc.version}";
#   entrypoint = [ "${pkgs.orthanc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "orthanc";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
