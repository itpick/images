{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-ingress-defaultbackend
# Reference: https://images.chainguard.dev/directory/image/kubernetes-ingress-defaultbackend/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-ingress-defaultbackend (1.37.4-r0)

# TODO: Implement kubernetes-ingress-defaultbackend image
throw "Image 'kubernetes-ingress-defaultbackend' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-ingress-defaultbackend";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-ingress-defaultbackend";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
