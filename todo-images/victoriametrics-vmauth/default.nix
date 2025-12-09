{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-vmauth
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-vmauth/overview

# Packages NOT in nixpkgs (need custom derivations):
#   victoriametrics-vmauth (1.131.0-r1)

# TODO: Implement victoriametrics-vmauth image
throw "Image 'victoriametrics-vmauth' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "victoriametrics-vmauth";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-vmauth";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
