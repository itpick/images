{ buildCLIImage, pkgs, lib, ... }:

# Image: nova
# Reference: https://images.chainguard.dev/directory/image/nova/overview

# Packages available in nixpkgs:
#   pkgs.nova  # nova (3.11.9-r0)

# TODO: Implement nova image
throw "Image 'nova' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.nova;
#   name = "nova";
#   tag = "v${pkgs.nova.version}";
#   entrypoint = [ "${pkgs.nova}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "nova";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
