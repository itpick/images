{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-kube-events
# Reference: https://images.chainguard.dev/directory/image/newrelic-kube-events/overview

# TODO: Implement newrelic-kube-events image
throw "Image 'newrelic-kube-events' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "newrelic-kube-events";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-kube-events";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
