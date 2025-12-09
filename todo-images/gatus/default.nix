{ buildCLIImage, pkgs, lib, ... }:

# Image: gatus
# Reference: https://images.chainguard.dev/directory/image/gatus/overview

# Packages available in nixpkgs:
#   pkgs.gatus  # gatus (5.33.0-r1)

# TODO: Implement gatus image
throw "Image 'gatus' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gatus;
#   name = "gatus";
#   tag = "v${pkgs.gatus.version}";
#   entrypoint = [ "${pkgs.gatus}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gatus";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
