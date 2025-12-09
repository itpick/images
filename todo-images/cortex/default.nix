{ buildCLIImage, pkgs, lib, ... }:

# Image: cortex
# Reference: https://images.chainguard.dev/directory/image/cortex/overview

# Packages available in nixpkgs:
#   pkgs.cortex-tools  # cortex (1.20.1-r0)

# TODO: Implement cortex image
throw "Image 'cortex' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cortex-tools;
#   name = "cortex";
#   tag = "v${pkgs.cortex-tools.version}";
#   entrypoint = [ "${pkgs.cortex-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cortex";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
