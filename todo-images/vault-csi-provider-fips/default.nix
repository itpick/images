{ buildCLIImage, pkgs, lib, ... }:

# Image: vault-csi-provider-fips
# Reference: https://images.chainguard.dev/directory/image/vault-csi-provider-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   vault-csi-provider-fips (1.6.0-r3)

# TODO: Implement vault-csi-provider-fips image
throw "Image 'vault-csi-provider-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "vault-csi-provider-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "vault-csi-provider-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
