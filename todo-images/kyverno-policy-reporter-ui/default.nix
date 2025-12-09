{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter-ui
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter-ui/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter-ui (2.5.0-r1)

# TODO: Implement kyverno-policy-reporter-ui image
throw "Image 'kyverno-policy-reporter-ui' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-policy-reporter-ui";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter-ui";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
