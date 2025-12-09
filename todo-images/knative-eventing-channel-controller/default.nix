{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-channel-controller
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-channel-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-channel-controller (1.19.8-r2)

# TODO: Implement knative-eventing-channel-controller image
throw "Image 'knative-eventing-channel-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-channel-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-channel-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
