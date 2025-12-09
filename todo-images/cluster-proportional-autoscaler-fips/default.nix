{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-proportional-autoscaler-fips
# Reference: https://images.chainguard.dev/directory/image/cluster-proportional-autoscaler-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-proportional-autoscaler-fips (1.10.2-r7)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cluster-proportional-autoscaler-fips image
throw "Image 'cluster-proportional-autoscaler-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cluster-proportional-autoscaler-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-proportional-autoscaler-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
