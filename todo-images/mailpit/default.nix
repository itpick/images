{ buildCLIImage, pkgs, lib, ... }:

# Image: mailpit
# Reference: https://images.chainguard.dev/directory/image/mailpit/overview

# Packages available in nixpkgs:
#   pkgs.mailpit  # mailpit (1.28.0-r1)

# TODO: Implement mailpit image
throw "Image 'mailpit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.mailpit;
#   name = "mailpit";
#   tag = "v${pkgs.mailpit.version}";
#   entrypoint = [ "${pkgs.mailpit}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mailpit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
