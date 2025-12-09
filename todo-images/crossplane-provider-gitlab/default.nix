{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-provider-gitlab
# Reference: https://images.chainguard.dev/directory/image/crossplane-provider-gitlab/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gitlab (0.14.0-r1)

# TODO: Implement crossplane-provider-gitlab image
throw "Image 'crossplane-provider-gitlab' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-provider-gitlab";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-provider-gitlab";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
