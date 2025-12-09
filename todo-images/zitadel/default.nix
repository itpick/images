{ buildCLIImage, pkgs, lib, ... }:

# Image: zitadel
# Reference: https://images.chainguard.dev/directory/image/zitadel/overview

# Packages available in nixpkgs:
#   pkgs.zitadel  # zitadel-4 (4.7.0-r2)

# TODO: Implement zitadel image
throw "Image 'zitadel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.zitadel;
#   name = "zitadel";
#   tag = "v${pkgs.zitadel.version}";
#   entrypoint = [ "${pkgs.zitadel}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "zitadel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
