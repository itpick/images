{ buildCLIImage, pkgs, lib, ... }:

# Image: ingress-nginx-custom-error-pages-iamguarded
# Reference: https://images.chainguard.dev/directory/image/ingress-nginx-custom-error-pages-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ingress-nginx-custom-error-pages-1.14 (1.14.1-r0)
#   ld-linux (2.42-r4)

# TODO: Implement ingress-nginx-custom-error-pages-iamguarded image
throw "Image 'ingress-nginx-custom-error-pages-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ingress-nginx-custom-error-pages-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ingress-nginx-custom-error-pages-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
