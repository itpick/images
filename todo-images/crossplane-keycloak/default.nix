{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-keycloak
# Reference: https://images.chainguard.dev/directory/image/crossplane-keycloak/overview

# Packages available in nixpkgs:
#   pkgs.terraform  # terraform-1.14 (1.14.1-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-keycloak (2.12.0-r0)

# TODO: Implement crossplane-keycloak image
throw "Image 'crossplane-keycloak' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.terraform;
#   name = "crossplane-keycloak";
#   tag = "v${pkgs.terraform.version}";
#   entrypoint = [ "${pkgs.terraform}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-keycloak";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
