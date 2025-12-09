{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-policy-reporter-plugin-trivy
# Reference: https://images.chainguard.dev/directory/image/kyverno-policy-reporter-plugin-trivy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kyverno-policy-reporter-plugins-trivy (0.4.11-r2)

# TODO: Implement kyverno-policy-reporter-plugin-trivy image
throw "Image 'kyverno-policy-reporter-plugin-trivy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-policy-reporter-plugin-trivy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-policy-reporter-plugin-trivy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
