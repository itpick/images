{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-helm-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-helm-controller/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-helm-controller (0.5.2-r1)
#   ld-linux (2.42-r4)

# TODO: Implement cluster-api-helm-controller image
throw "Image 'cluster-api-helm-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cluster-api-helm-controller";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-helm-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
