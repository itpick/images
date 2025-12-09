{ buildCLIImage, pkgs, lib, ... }:

# Image: opentofu
# Reference: https://images.chainguard.dev/directory/image/opentofu/overview

# Packages available in nixpkgs:
#   pkgs.opentofu  # opentofu-1.10 (1.10.7-r1)

# TODO: Implement opentofu image
throw "Image 'opentofu' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.opentofu;
#   name = "opentofu";
#   tag = "v${pkgs.opentofu.version}";
#   entrypoint = [ "${pkgs.opentofu}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opentofu";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
