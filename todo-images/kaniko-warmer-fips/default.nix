{ buildCLIImage, pkgs, lib, ... }:

# Image: kaniko-warmer-fips
# Reference: https://images.chainguard.dev/directory/image/kaniko-warmer-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   docker-credential-acr-env-fips (0.7.0-r10)
#   docker-credential-ecr-login-fips (0.11.0-r1)
#   docker-credential-gcr-fips (2.1.30-r6)
#   kaniko-warmer-fips (1.25.5-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kaniko-warmer-fips image
throw "Image 'kaniko-warmer-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kaniko-warmer-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kaniko-warmer-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
