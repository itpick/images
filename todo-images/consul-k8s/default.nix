{ buildCLIImage, pkgs, lib, ... }:

# Image: consul-k8s
# Reference: https://images.chainguard.dev/directory/image/consul-k8s/overview

# Packages NOT in nixpkgs (need custom derivations):
#   consul-k8s-1.7 (1.7.8-r0)
#   go-discover (0_git20251128-r0)

# TODO: Implement consul-k8s image
throw "Image 'consul-k8s' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "consul-k8s";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "consul-k8s";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
