{ buildCLIImage, pkgs, lib, ... }:

# Image: kustomize-mutating-webhook
# Reference: https://images.chainguard.dev/directory/image/kustomize-mutating-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   fluxcd-kustomize-mutating-webhook (0.7.0-r1)

# TODO: Implement kustomize-mutating-webhook image
throw "Image 'kustomize-mutating-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kustomize-mutating-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kustomize-mutating-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
