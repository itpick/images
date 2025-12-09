{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-mtchannel-broker
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-mtchannel-broker/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-mtchannel-broker (1.19.8-r2)

# TODO: Implement knative-eventing-mtchannel-broker image
throw "Image 'knative-eventing-mtchannel-broker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-mtchannel-broker";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-mtchannel-broker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
