{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/cert-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cert-exporter-fips (2.17.0-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cert-exporter-fips image
throw "Image 'cert-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cert-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
