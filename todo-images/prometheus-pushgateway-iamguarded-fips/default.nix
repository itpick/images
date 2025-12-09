{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-pushgateway-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-pushgateway-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-pushgateway-fips (1.11.2-r3)

# TODO: Implement prometheus-pushgateway-iamguarded-fips image
throw "Image 'prometheus-pushgateway-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-pushgateway-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-pushgateway-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
