{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-logging-operator
# Reference: https://images.chainguard.dev/directory/image/kube-logging-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-logging-operator (6.2.1-r1)

# TODO: Implement kube-logging-operator image
throw "Image 'kube-logging-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-logging-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-logging-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
