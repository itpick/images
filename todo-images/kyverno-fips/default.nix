{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-fips
# Reference: https://images.chainguard.dev/directory/image/kyverno-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-fips-1.34 (1.34.2-r2)
#   kubectl-fips-latest (0-r6)
#   kyverno-fips-1.16 (1.16.1-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kyverno-fips image
throw "Image 'kyverno-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kyverno-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
