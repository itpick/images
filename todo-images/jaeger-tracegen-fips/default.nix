{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-tracegen-fips
# Reference: https://images.chainguard.dev/directory/image/jaeger-tracegen-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-fips-tracegen (2.12.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement jaeger-tracegen-fips image
throw "Image 'jaeger-tracegen-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "jaeger-tracegen-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-tracegen-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
