{ buildCLIImage, pkgs, lib, ... }:

# Image: clickhouse-operator-metrics-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/clickhouse-operator-metrics-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   clickhouse-operator-fips-metrics-exporter (0.25.5-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement clickhouse-operator-metrics-exporter-fips image
throw "Image 'clickhouse-operator-metrics-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "clickhouse-operator-metrics-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "clickhouse-operator-metrics-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
