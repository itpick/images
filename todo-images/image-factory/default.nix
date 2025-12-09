{ buildCLIImage, pkgs, lib, ... }:

# Image: image-factory
# Reference: https://images.chainguard.dev/directory/image/image-factory/overview

# Packages available in nixpkgs:
#   pkgs.acl  # acl (2.3.2-r54)
#   pkgs.cpio  # cpio (2.15-r5)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dosfstools  # dosfstools (4.2-r43)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.sleek-grub-theme  # grub (2.12-r46)
#   pkgs.inih  # inih (62-r1)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libburn  # libburn (1.5.6-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libisoburn  # libisoburn (1.5.6-r2)
#   pkgs.libisofs  # libisofs (1.5.6-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.liburing  # liburing (2.12-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.mtools  # mtools (4.0.49-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pcre2  # pcre2 (10.47-r0)
#   pkgs.pigz  # pigz (2.8-r3)
#   pkgs.qemu-utils  # qemu-utils (10.1.3-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.squashfstools  # squashfs-tools (4.7.4-r0)
#   pkgs.xfsprogs  # xfsprogs (6.17.0-r2)
#   pkgs.xorriso  # xorriso (1.5.6-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)
#   pkgs.zstd  # zstd (1.5.7-r5)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   fuse3-libs (3.17.4-r0)
#   glibc-iconv (2.42-r4)
#   gnutar-rmt (1.35-r6)
#   grub-efi-libs (2.12-r46)
#   heimdal-libs (7.8.0-r42)
#   image-factory (0.9.0-r1)
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
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libmount (2.41.2-r2)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   open-vmdk (0.3.12-r0)
#   py3-pip-wheel (25.3-r2)
#   py3.13-lxml (6.0.2-r1)
#   py3.13-pyyaml (6.0.3-r0)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)
#   xfsprogs-core (6.17.0-r2)

# TODO: Implement image-factory image
throw "Image 'image-factory' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.acl;
#   name = "image-factory";
#   tag = "v${pkgs.acl.version}";
#   entrypoint = [ "${pkgs.acl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "image-factory";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
