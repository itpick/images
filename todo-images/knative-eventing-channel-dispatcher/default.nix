{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-channel-dispatcher
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-channel-dispatcher/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-channel-dispatcher (1.19.8-r2)

# TODO: Implement knative-eventing-channel-dispatcher image
throw "Image 'knative-eventing-channel-dispatcher' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-channel-dispatcher";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-channel-dispatcher";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
