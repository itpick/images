{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-operator-fips
# Reference: https://images.chainguard.dev/directory/image/gitlab-operator-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gitlab-operator-charts (2.5.2-r0)
#   gitlab-operator-fips (2.5.2-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r3)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement gitlab-operator-fips image
throw "Image 'gitlab-operator-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gitlab-operator-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-operator-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
