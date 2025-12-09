{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-logstash-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-logstash-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   logstash-exporter-fips (1.9.1-r3)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement prometheus-logstash-exporter-fips image
throw "Image 'prometheus-logstash-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-logstash-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-logstash-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
