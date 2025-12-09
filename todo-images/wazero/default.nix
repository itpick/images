{ buildCLIImage, pkgs, lib, ... }:

# Image: wazero
# Reference: https://images.chainguard.dev/directory/image/wazero/overview

# Packages available in nixpkgs:
#   pkgs.wazero  # wazero (1.10.1-r1)

# TODO: Implement wazero image
throw "Image 'wazero' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.wazero;
#   name = "wazero";
#   tag = "v${pkgs.wazero.version}";
#   entrypoint = [ "${pkgs.wazero}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "wazero";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
