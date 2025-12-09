{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-portal-fips
# Reference: https://images.chainguard.dev/directory/image/harbor-portal-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   harbor-2.9-portal-nginx-config (2.9.5-r17)
#   harbor-fips-2.14-portal (2.14.1-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement harbor-portal-fips image
throw "Image 'harbor-portal-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-portal-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-portal-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
