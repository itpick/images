{ buildCLIImage, pkgs, lib, ... }:

# Image: bank-vaults-fips
# Reference: https://images.chainguard.dev/directory/image/bank-vaults-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   bank-vaults-fips (1.20.4-r34)
#   bank-vaults-template-fips (1.20.4-r34)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement bank-vaults-fips image
throw "Image 'bank-vaults-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "bank-vaults-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "bank-vaults-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
