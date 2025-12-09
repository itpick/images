{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-operator
# Reference: https://images.chainguard.dev/directory/image/gitlab-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gitlab-operator (2.5.2-r0)
#   gitlab-operator-charts (2.5.2-r0)
#   ld-linux (2.42-r4)

# TODO: Implement gitlab-operator image
throw "Image 'gitlab-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gitlab-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
