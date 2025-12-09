{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-logging-operator-config-reloader
# Reference: https://images.chainguard.dev/directory/image/kube-logging-operator-config-reloader/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-logging-operator-config-reloader (6.2.1-r1)

# TODO: Implement kube-logging-operator-config-reloader image
throw "Image 'kube-logging-operator-config-reloader' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-logging-operator-config-reloader";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-logging-operator-config-reloader";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
