{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-modelmesh-controller
# Reference: https://images.chainguard.dev/directory/image/kserve-modelmesh-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kserve-modelmesh-serving (0.12.0-r18)

# TODO: Implement kserve-modelmesh-controller image
throw "Image 'kserve-modelmesh-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kserve-modelmesh-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-modelmesh-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
