{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-sql-fips
# Reference: https://images.chainguard.dev/directory/image/crossplane-sql-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-sql-fips (0.13.0-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement crossplane-sql-fips image
throw "Image 'crossplane-sql-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "crossplane-sql-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-sql-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
