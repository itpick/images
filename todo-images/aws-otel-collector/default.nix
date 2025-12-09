{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-otel-collector
# Reference: https://images.chainguard.dev/directory/image/aws-otel-collector/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-otel-collector (0.45.1-r2)
#   aws-otel-collector-healthcheck (0.45.1-r2)
#   ld-linux (2.42-r4)

# TODO: Implement aws-otel-collector image
throw "Image 'aws-otel-collector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "aws-otel-collector";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-otel-collector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
