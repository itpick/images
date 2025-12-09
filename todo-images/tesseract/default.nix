{ buildCLIImage, pkgs, lib, ... }:

# Image: tesseract
# Reference: https://images.chainguard.dev/directory/image/tesseract/overview

# Packages available in nixpkgs:
#   pkgs.cairo  # cairo (1.18.4-r1)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.fribidi  # fribidi (1.0.16-r2)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.graphite2  # graphite2 (1.3.14-r6)
#   pkgs.harfbuzz  # harfbuzz (12.2.0-r0)
#   pkgs.libarchive  # libarchive (3.8.4-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxft  # libxft (2.3.9-r1)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openjpeg  # openjpeg (2.5.4-r0)
#   pkgs.pango  # pango (1.56.4-r1)
#   pkgs.pixman  # pixman (0.46.4-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tesseract  # tesseract (5.5.1-r4)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   fontconfig-config (2.17.1-r1)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)
#   tesseract-eng (5.5.1-r4)
#   tesseract-osd (5.5.1-r4)
#   tiff (4.7.1-r0)

# TODO: Implement tesseract image
throw "Image 'tesseract' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tesseract;
#   name = "tesseract";
#   tag = "v${pkgs.tesseract.version}";
#   entrypoint = [ "${pkgs.tesseract}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tesseract";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
