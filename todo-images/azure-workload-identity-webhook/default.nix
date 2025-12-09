{ buildCLIImage, pkgs, lib, ... }:

# Image: azure-workload-identity-webhook
# Reference: https://images.chainguard.dev/directory/image/azure-workload-identity-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   azure-workload-identity-webhook (1.5.1-r5)

# TODO: Implement azure-workload-identity-webhook image
throw "Image 'azure-workload-identity-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "azure-workload-identity-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "azure-workload-identity-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
