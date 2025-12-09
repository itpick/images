{ buildCLIImage, pkgs, lib, ... }:

# Image: ratify-fips
# Reference: https://images.chainguard.dev/directory/image/ratify-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   ratify-fips (1.4.0-r7)
#   ratify-fips-licensechecker (1.4.0-r7)
#   ratify-fips-sbom (1.4.0-r7)
#   ratify-fips-schemavalidator (1.4.0-r7)
#   ratify-fips-vulnerabilityreport (1.4.0-r7)

# TODO: Implement ratify-fips image
throw "Image 'ratify-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ratify-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ratify-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
