{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-ingress-defaultbackend-fips
# Reference: https://images.chainguard.dev/directory/image/kubernetes-ingress-defaultbackend-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-ingress-defaultbackend-fips (1.37.4-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kubernetes-ingress-defaultbackend-fips image
throw "Image 'kubernetes-ingress-defaultbackend-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubernetes-ingress-defaultbackend-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-ingress-defaultbackend-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
