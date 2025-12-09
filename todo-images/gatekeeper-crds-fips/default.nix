{ buildCLIImage, pkgs, lib, ... }:

# Image: gatekeeper-crds-fips
# Reference: https://images.chainguard.dev/directory/image/gatekeeper-crds-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gatekeeper-3.21-crds (3.21.0-r2)
#   gatekeeper-fips-3.21 (3.21.0-r2)
#   kubectl-fips-1.34 (1.34.2-r1)
#   kubectl-fips-latest (0-r5)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement gatekeeper-crds-fips image
throw "Image 'gatekeeper-crds-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gatekeeper-crds-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "gatekeeper-crds-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
