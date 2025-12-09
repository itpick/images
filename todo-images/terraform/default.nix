{ buildCLIImage, pkgs, lib, ... }:

# Image: terraform
# Reference: https://images.chainguard.dev/directory/image/terraform/overview

# Packages available in nixpkgs:
#   pkgs.terraform  # terraform-1.14 (1.14.1-r1)

# TODO: Implement terraform image
throw "Image 'terraform' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.terraform;
#   name = "terraform";
#   tag = "v${pkgs.terraform.version}";
#   entrypoint = [ "${pkgs.terraform}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "terraform";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
