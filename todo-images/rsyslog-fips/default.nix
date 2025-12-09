{ buildCLIImage, pkgs, lib, ... }:

# Image: rsyslog-fips
# Reference: https://images.chainguard.dev/directory/image/rsyslog-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libestr  # libestr (0.1.11-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.rsyslog  # rsyslog (8.2512.0-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libfastjson (1.2304.0-r2)
#   libssl3 (3.6.0-r4)
#   libsystemd (258.2-r3)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   rsyslog-config (8.2512.0-r0)
#   rsyslog-uxsock (8.2512.0-r0)

# TODO: Implement rsyslog-fips image
throw "Image 'rsyslog-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "rsyslog-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "rsyslog-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
