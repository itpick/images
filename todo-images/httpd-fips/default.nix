{ buildCLIImage, pkgs, lib, ... }:

# Image: httpd-fips
# Reference: https://images.chainguard.dev/directory/image/httpd-fips/overview

# Packages available in nixpkgs:
#   pkgs.aprutil  # apr-util (1.6.3-r8)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   apache2 (2.4.65-r3)
#   apache2-config (2.4.65-r3)
#   heimdal-libs (7.8.0-r42)
#   ld-linux (2.42-r4)
#   libapr (1.7.6-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   lua5.4 (5.4.8-r3)
#   lua5.4-libs (5.4.8-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement httpd-fips image
throw "Image 'httpd-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.aprutil;
#   name = "httpd-fips";
#   tag = "v${pkgs.aprutil.version}";
#   entrypoint = [ "${pkgs.aprutil}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "httpd-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
