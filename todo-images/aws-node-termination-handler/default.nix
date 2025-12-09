{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-node-termination-handler
# Reference: https://images.chainguard.dev/directory/image/aws-node-termination-handler/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-node-termination-handler (1.25.3-r2)
#   ld-linux (2.42-r4)

# TODO: Implement aws-node-termination-handler image
throw "Image 'aws-node-termination-handler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "aws-node-termination-handler";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-node-termination-handler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
