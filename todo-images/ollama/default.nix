{ buildCLIImage, pkgs, lib, ... }:

# Image: ollama
# Reference: https://images.chainguard.dev/directory/image/ollama/overview

# TODO: Implement ollama image
throw "Image 'ollama' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ollama";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ollama";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
