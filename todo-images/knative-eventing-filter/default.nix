{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-filter
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-filter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-filter (1.19.8-r2)

# TODO: Implement knative-eventing-filter image
throw "Image 'knative-eventing-filter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-filter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-filter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
