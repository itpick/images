{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter-fips
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter-fips (3.7.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kyverno-policy-reporter-fips image
throw "Image 'kyverno-policy-reporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kyverno-policy-reporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
