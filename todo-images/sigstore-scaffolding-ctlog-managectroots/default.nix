{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-ctlog-managectroots
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-ctlog-managectroots/overview

# TODO: Implement sigstore-scaffolding-ctlog-managectroots image
throw "Image 'sigstore-scaffolding-ctlog-managectroots' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-ctlog-managectroots";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-ctlog-managectroots";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
