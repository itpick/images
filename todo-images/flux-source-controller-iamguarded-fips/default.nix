{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-source-controller-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/flux-source-controller-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   flux-source-controller-fips (1.7.4-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement flux-source-controller-iamguarded-fips image
throw "Image 'flux-source-controller-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "flux-source-controller-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1337";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-source-controller-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
