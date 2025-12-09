{ buildCLIImage, pkgs, lib, ... }:

# Image: ghidra
# Reference: https://images.chainguard.dev/directory/image/ghidra/overview

# TODO: Implement ghidra image
throw "Image 'ghidra' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ghidra";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ghidra";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
