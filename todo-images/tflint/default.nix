{ buildCLIImage, pkgs, lib, ... }:

# Image: tflint
# Reference: https://images.chainguard.dev/directory/image/tflint/overview

# Packages available in nixpkgs:
#   pkgs.tflint  # tflint (0.60.0-r2)

# TODO: Implement tflint image
throw "Image 'tflint' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tflint;
#   name = "tflint";
#   tag = "v${pkgs.tflint.version}";
#   entrypoint = [ "${pkgs.tflint}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tflint";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
