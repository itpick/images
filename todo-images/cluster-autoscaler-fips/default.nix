{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-autoscaler-fips
# Reference: https://images.chainguard.dev/directory/image/cluster-autoscaler-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-autoscaler-fips-1.34 (1.34.2-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cluster-autoscaler-fips image
throw "Image 'cluster-autoscaler-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cluster-autoscaler-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-autoscaler-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
