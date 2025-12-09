{ buildCLIImage, pkgs, lib, ... }:

# Image: rke2-cloud-provider-fips
# Reference: https://images.chainguard.dev/directory/image/rke2-cloud-provider-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   rke2-cloud-provider-fips (1.34.2-r3)

# TODO: Implement rke2-cloud-provider-fips image
throw "Image 'rke2-cloud-provider-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "rke2-cloud-provider-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rke2-cloud-provider-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
