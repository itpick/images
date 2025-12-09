{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-node-driver-registrar
# Reference: https://images.chainguard.dev/directory/image/calico-node-driver-registrar/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-node-driver-registrar-2.15 (2.15.0-r2)

# TODO: Implement calico-node-driver-registrar image
throw "Image 'calico-node-driver-registrar' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "calico-node-driver-registrar";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-node-driver-registrar";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
