{ buildCLIImage, pkgs, lib, ... }:

# Image: openbao-k8s-fips
# Reference: https://images.chainguard.dev/directory/image/openbao-k8s-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openbao-k8s-fips (1.4.0-r17)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement openbao-k8s-fips image
throw "Image 'openbao-k8s-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "openbao-k8s-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "100";
#
#   labels = {
#     "org.opencontainers.image.title" = "openbao-k8s-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
