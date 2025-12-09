{ buildCLIImage, pkgs, lib, ... }:

# Image: step-cli
# Reference: https://images.chainguard.dev/directory/image/step-cli/overview

# Packages available in nixpkgs:
#   pkgs.step-cli  # step (0.29.0-r0)

# TODO: Implement step-cli image
throw "Image 'step-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.step-cli;
#   name = "step-cli";
#   tag = "v${pkgs.step-cli.version}";
#   entrypoint = [ "${pkgs.step-cli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "step-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
