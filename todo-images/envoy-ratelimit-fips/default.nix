{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy-ratelimit-fips
# Reference: https://images.chainguard.dev/directory/image/envoy-ratelimit-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   envoy-ratelimit-fips (0.0.0_git20251207-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement envoy-ratelimit-fips image
throw "Image 'envoy-ratelimit-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "envoy-ratelimit-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy-ratelimit-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
