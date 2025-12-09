{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-load-balancer-controller-fips
# Reference: https://images.chainguard.dev/directory/image/aws-load-balancer-controller-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-load-balancer-controller-fips (2.16.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement aws-load-balancer-controller-fips image
throw "Image 'aws-load-balancer-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "aws-load-balancer-controller-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-load-balancer-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
