{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter (3.7.0-r1)

# TODO: Implement kyverno-policy-reporter image
throw "Image 'kyverno-policy-reporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-policy-reporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
