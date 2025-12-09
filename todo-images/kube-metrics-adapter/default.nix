{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-metrics-adapter
# Reference: https://images.chainguard.dev/directory/image/kube-metrics-adapter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-metrics-adapter (0.2.6-r2)

# TODO: Implement kube-metrics-adapter image
throw "Image 'kube-metrics-adapter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-metrics-adapter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-metrics-adapter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
