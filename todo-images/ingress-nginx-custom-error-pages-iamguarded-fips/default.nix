{ buildCLIImage, pkgs, lib, ... }:

# Image: ingress-nginx-custom-error-pages-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/ingress-nginx-custom-error-pages-iamguarded-fips/overview

# TODO: Implement ingress-nginx-custom-error-pages-iamguarded-fips image
throw "Image 'ingress-nginx-custom-error-pages-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ingress-nginx-custom-error-pages-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ingress-nginx-custom-error-pages-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
