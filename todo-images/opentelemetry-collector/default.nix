{ buildCLIImage, pkgs, lib, ... }:

# Image: opentelemetry-collector
# Reference: https://images.chainguard.dev/directory/image/opentelemetry-collector/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.opentelemetry-collector  # opentelemetry-collector (0.141.0-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)

# TODO: Implement opentelemetry-collector image
throw "Image 'opentelemetry-collector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.opentelemetry-collector;
#   name = "opentelemetry-collector";
#   tag = "v${pkgs.opentelemetry-collector.version}";
#   entrypoint = [ "${pkgs.opentelemetry-collector}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opentelemetry-collector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
