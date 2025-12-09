{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-oidc-discovery-provider-fips
# Reference: https://images.chainguard.dev/directory/image/spire-oidc-discovery-provider-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   spire-oidc-discovery-provider-fips (1.13.3-r3)

# TODO: Implement spire-oidc-discovery-provider-fips image
throw "Image 'spire-oidc-discovery-provider-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "spire-oidc-discovery-provider-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-oidc-discovery-provider-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
