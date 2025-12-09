{ buildCLIImage, pkgs, lib, ... }:

# Image: memcached-fips
# Reference: https://images.chainguard.dev/directory/image/memcached-fips/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.memcached  # memcached (1.6.39-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   heimdal-libs (7.8.0-r42)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement memcached-fips image
throw "Image 'memcached-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "memcached-fips";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "memcached-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
