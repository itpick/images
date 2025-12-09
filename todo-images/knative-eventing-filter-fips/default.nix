{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-filter-fips
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-filter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-fips-1.19-filter (1.19.8-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement knative-eventing-filter-fips image
throw "Image 'knative-eventing-filter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "knative-eventing-filter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-filter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
