{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-kas-fips
# Reference: https://images.chainguard.dev/directory/image/gitlab-kas-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gitlab-kas-fips-18.6 (18.6.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement gitlab-kas-fips image
throw "Image 'gitlab-kas-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gitlab-kas-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-kas-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
