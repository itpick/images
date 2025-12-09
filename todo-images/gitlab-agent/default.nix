{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-agent
# Reference: https://images.chainguard.dev/directory/image/gitlab-agent/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gitlab-agent-18.6 (18.6.1-r1)
#   ld-linux (2.42-r4)

# TODO: Implement gitlab-agent image
throw "Image 'gitlab-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gitlab-agent";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
