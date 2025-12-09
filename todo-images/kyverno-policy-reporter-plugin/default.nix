{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter-plugin
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter-plugin/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter-kyverno-plugin (1.6.4-r14)

# TODO: Implement kyverno-policy-reporter-plugin image
throw "Image 'kyverno-policy-reporter-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-policy-reporter-plugin";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
