{ buildCLIImage, pkgs, lib, ... }:

# Image: openfga
# Reference: https://images.chainguard.dev/directory/image/openfga/overview

# Packages available in nixpkgs:
#   pkgs.grpc-health-probe  # grpc-health-probe (0.4.42-r0)
#   pkgs.openfga  # openfga (1.11.2-r0)

# TODO: Implement openfga image
throw "Image 'openfga' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.openfga;
#   name = "openfga";
#   tag = "v${pkgs.openfga.version}";
#   entrypoint = [ "${pkgs.openfga}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "openfga";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
