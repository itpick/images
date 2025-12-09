{ buildCLIImage, pkgs, lib, ... }:

# Image: grpc-health-probe
# Reference: https://images.chainguard.dev/directory/image/grpc-health-probe/overview

# Packages available in nixpkgs:
#   pkgs.grpc-health-probe  # grpc-health-probe (0.4.42-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)

# TODO: Implement grpc-health-probe image
throw "Image 'grpc-health-probe' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.grpc-health-probe;
#   name = "grpc-health-probe";
#   tag = "v${pkgs.grpc-health-probe.version}";
#   entrypoint = [ "${pkgs.grpc-health-probe}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grpc-health-probe";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
