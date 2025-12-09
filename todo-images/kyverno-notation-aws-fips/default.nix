{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-notation-aws-fips
# Reference: https://images.chainguard.dev/directory/image/kyverno-notation-aws-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-signer-notation-plugin-fips (1.0.2292-r4)
#   kyverno-notation-aws-fips (1.1-r25)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kyverno-notation-aws-fips image
throw "Image 'kyverno-notation-aws-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kyverno-notation-aws-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-notation-aws-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
