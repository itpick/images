{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter-plugin-kyverno
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter-plugin-kyverno/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter-plugins-kyverno (0.5.2-r2)

# TODO: Implement kyverno-policy-reporter-plugin-kyverno image
throw "Image 'kyverno-policy-reporter-plugin-kyverno' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-policy-reporter-plugin-kyverno";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter-plugin-kyverno";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
