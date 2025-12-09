{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-jobsink
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-jobsink/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-jobsink (1.19.8-r2)

# TODO: Implement knative-eventing-jobsink image
throw "Image 'knative-eventing-jobsink' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-jobsink";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-jobsink";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
