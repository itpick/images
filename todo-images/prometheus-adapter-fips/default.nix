{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-adapter-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-adapter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-adapter-fips (0.12.0-r19)

# TODO: Implement prometheus-adapter-fips image
throw "Image 'prometheus-adapter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-adapter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-adapter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
