{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-serving-activator
# Reference: https://images.chainguard.dev/directory/image/knative-serving-activator/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-serving-1.19-activator (1.19.7-r2)

# TODO: Implement knative-serving-activator image
throw "Image 'knative-serving-activator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "knative-serving-activator";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-serving-activator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
