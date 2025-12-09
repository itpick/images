{ buildCLIImage, pkgs, lib, ... }:

# Image: cloudflared
# Reference: https://images.chainguard.dev/directory/image/cloudflared/overview

# Packages available in nixpkgs:
#   pkgs.cloudflared  # cloudflared (2025.11.1-r2)

# TODO: Implement cloudflared image
throw "Image 'cloudflared' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cloudflared;
#   name = "cloudflared";
#   tag = "v${pkgs.cloudflared.version}";
#   entrypoint = [ "${pkgs.cloudflared}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloudflared";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
