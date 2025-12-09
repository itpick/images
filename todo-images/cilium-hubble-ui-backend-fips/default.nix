{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-hubble-ui-backend-fips
# Reference: https://images.chainguard.dev/directory/image/cilium-hubble-ui-backend-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   hubble-ui-backend-fips (0.13.3-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cilium-hubble-ui-backend-fips image
throw "Image 'cilium-hubble-ui-backend-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-hubble-ui-backend-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-hubble-ui-backend-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
