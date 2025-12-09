{ buildCLIImage, pkgs, lib, ... }:

# Image: fulcio
# Reference: https://images.chainguard.dev/directory/image/fulcio/overview

# Packages available in nixpkgs:
#   pkgs.fulcio  # fulcio (1.8.3-r0)

# TODO: Implement fulcio image
throw "Image 'fulcio' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.fulcio;
#   name = "fulcio";
#   tag = "v${pkgs.fulcio.version}";
#   entrypoint = [ "${pkgs.fulcio}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "fulcio";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
