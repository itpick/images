{ buildCLIImage, pkgs, lib, ... }:

# Image: glibc-openssl-fips-mip
# Reference: https://images.chainguard.dev/directory/image/glibc-openssl-fips-mip/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   nist-esv-191 (1-r2)
#   nist-mip-openssl-provider-fips-3.6 (1-r2)
#   openssl-config-fipshardened-3.6.0 (3.6.0-r3)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.6.0 (3.6.0-r2)

# TODO: Implement glibc-openssl-fips-mip image
throw "Image 'glibc-openssl-fips-mip' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "glibc-openssl-fips-mip";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "glibc-openssl-fips-mip";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
