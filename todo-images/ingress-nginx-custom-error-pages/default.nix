{ buildCLIImage, pkgs, lib, ... }:

# Image: ingress-nginx-custom-error-pages
# Reference: https://images.chainguard.dev/directory/image/ingress-nginx-custom-error-pages/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ingress-nginx-custom-error-pages-1.14 (1.14.0-r1)
#   ld-linux (2.42-r4)

# TODO: Implement ingress-nginx-custom-error-pages image
throw "Image 'ingress-nginx-custom-error-pages' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ingress-nginx-custom-error-pages";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ingress-nginx-custom-error-pages";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
