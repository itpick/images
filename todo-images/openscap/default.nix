{ buildCLIImage, pkgs, lib, ... }:

# Image: openscap
# Reference: https://images.chainguard.dev/directory/image/openscap/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openscap  # openscap (1.4.3-r0)
#   pkgs.python  # python-3.13 (3.13.11-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.scap-security-guide  # scap-security-guide (0.1.79-r0)
#   pkgs.xmlsec  # xmlsec (1.3.9-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   chainguard-security-guide (3.2.7-r0)
#   dbus-libs (1.16.2-r5)
#   docker-cli (29.1.2-r1)
#   heimdal-libs (7.8.0-r42)
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
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.13-certifi (2025.11.12-r0)
#   py3.13-charset-normalizer (3.4.4-r2)
#   py3.13-idna (3.11-r0)
#   py3.13-packaging (25.0-r2)
#   py3.13-pyparsing (3.2.5-r0)
#   py3.13-requests (2.32.5-r0)
#   py3.13-urllib3 (2.5.0-r2)
#   py3.13-websocket-client (1.9.0-r0)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)
#   xmlsec-legacy-openssl (1.3.9-r0)

# TODO: Implement openscap image
throw "Image 'openscap' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.openscap;
#   name = "openscap";
#   tag = "v${pkgs.openscap.version}";
#   entrypoint = [ "${pkgs.openscap}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "openscap";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
