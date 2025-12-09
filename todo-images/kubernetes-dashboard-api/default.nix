{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-api
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-api/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-dashboard-api (1.14.0-r1)
#   ld-linux (2.42-r4)

# TODO: Implement kubernetes-dashboard-api image
throw "Image 'kubernetes-dashboard-api' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubernetes-dashboard-api";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-api";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
