{ buildCLIImage, pkgs, lib, ... }:

# Image: sealed-secrets-kubeseal
# Reference: https://images.chainguard.dev/directory/image/sealed-secrets-kubeseal/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sealed-secrets-kubeseal (0.33.1-r2)

# TODO: Implement sealed-secrets-kubeseal image
throw "Image 'sealed-secrets-kubeseal' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sealed-secrets-kubeseal";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "sealed-secrets-kubeseal";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
