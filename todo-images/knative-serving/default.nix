{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-serving
# Reference: https://images.chainguard.dev/directory/image/knative-serving/overview

# TODO: Implement knative-serving image
throw "Image 'knative-serving' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-serving";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-serving";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
