{ buildCLIImage, pkgs, lib, ... }:

# Image: rekor-cli
# Reference: https://images.chainguard.dev/directory/image/rekor-cli/overview

# Packages available in nixpkgs:
#   pkgs.rekor-cli  # rekor-cli (1.4.3-r2)

# TODO: Implement rekor-cli image
throw "Image 'rekor-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.rekor-cli;
#   name = "rekor-cli";
#   tag = "v${pkgs.rekor-cli.version}";
#   entrypoint = [ "${pkgs.rekor-cli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rekor-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
