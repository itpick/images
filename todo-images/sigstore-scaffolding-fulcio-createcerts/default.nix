{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-fulcio-createcerts
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-fulcio-createcerts/overview

# TODO: Implement sigstore-scaffolding-fulcio-createcerts image
throw "Image 'sigstore-scaffolding-fulcio-createcerts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-fulcio-createcerts";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-fulcio-createcerts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
