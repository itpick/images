{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-default-user-credential-updater-iamguarded
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-default-user-credential-updater-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   rabbitmq-default-user-credential-updater (1.0.9-r1)

# TODO: Implement rabbitmq-default-user-credential-updater-iamguarded image
throw "Image 'rabbitmq-default-user-credential-updater-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rabbitmq-default-user-credential-updater-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-default-user-credential-updater-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
