{ buildCLIImage, pkgs, lib, ... }:

# Image: nrdot-collector-k8s-fips
# Reference: https://images.chainguard.dev/directory/image/nrdot-collector-k8s-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   nrdot-collector-k8s-fips (1.6.0-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement nrdot-collector-k8s-fips image
throw "Image 'nrdot-collector-k8s-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "nrdot-collector-k8s-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10001";
#
#   labels = {
#     "org.opencontainers.image.title" = "nrdot-collector-k8s-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
