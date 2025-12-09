{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-trivy-adapter-fips
# Reference: https://images.chainguard.dev/directory/image/harbor-trivy-adapter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   harbor-scanner-trivy-fips (0.31.4-r15)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   trivy-fips (0.68.1-r0)

# TODO: Implement harbor-trivy-adapter-fips image
throw "Image 'harbor-trivy-adapter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-trivy-adapter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-trivy-adapter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
