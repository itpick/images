{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-gcp-cloud-controller-manager-fips
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-gcp-cloud-controller-manager-fips/overview

# TODO: Implement cloud-provider-gcp-cloud-controller-manager-fips image
throw "Image 'cloud-provider-gcp-cloud-controller-manager-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-gcp-cloud-controller-manager-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-gcp-cloud-controller-manager-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
