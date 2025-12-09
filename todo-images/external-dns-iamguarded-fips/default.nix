{ buildCLIImage, pkgs, lib, ... }:

# Image: external-dns-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/external-dns-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   external-dns-fips-0.20 (0.20.0-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement external-dns-iamguarded-fips image
throw "Image 'external-dns-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "external-dns-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "external-dns-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
