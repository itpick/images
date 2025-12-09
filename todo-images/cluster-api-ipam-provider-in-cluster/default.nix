{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-ipam-provider-in-cluster
# Reference: https://images.chainguard.dev/directory/image/cluster-api-ipam-provider-in-cluster/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-ipam-provider-in-cluster (1.0.3-r3)

# TODO: Implement cluster-api-ipam-provider-in-cluster image
throw "Image 'cluster-api-ipam-provider-in-cluster' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-ipam-provider-in-cluster";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-ipam-provider-in-cluster";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
