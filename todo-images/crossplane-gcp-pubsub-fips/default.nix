{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-pubsub-fips
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-pubsub-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-pubsub-fips (2.2.0-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement crossplane-gcp-pubsub-fips image
throw "Image 'crossplane-gcp-pubsub-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "crossplane-gcp-pubsub-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-pubsub-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
