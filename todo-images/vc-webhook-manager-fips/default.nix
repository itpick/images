{ buildCLIImage, pkgs, lib, ... }:

# Image: vc-webhook-manager-fips
# Reference: https://images.chainguard.dev/directory/image/vc-webhook-manager-fips/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-fips-1.34 (1.34.2-r1)
#   kubectl-fips-latest (0-r5)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement vc-webhook-manager-fips image
throw "Image 'vc-webhook-manager-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "vc-webhook-manager-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vc-webhook-manager-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
