{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-gcp-cloud-controller-manager
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-gcp-cloud-controller-manager/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-release-go-runner (0.18.0-r6)

# TODO: Implement cloud-provider-gcp-cloud-controller-manager image
throw "Image 'cloud-provider-gcp-cloud-controller-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-gcp-cloud-controller-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-gcp-cloud-controller-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
