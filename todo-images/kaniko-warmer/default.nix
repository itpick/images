{ buildCLIImage, pkgs, lib, ... }:

# Image: kaniko-warmer
# Reference: https://images.chainguard.dev/directory/image/kaniko-warmer/overview

# Packages available in nixpkgs:
#   pkgs.docker-credential-gcr  # docker-credential-gcr (2.1.30-r7)

# Packages NOT in nixpkgs (need custom derivations):
#   docker-credential-acr-env (0.7.0-r27)
#   docker-credential-ecr-login (0.11.0-r1)
#   kaniko-warmer (1.25.5-r3)

# TODO: Implement kaniko-warmer image
throw "Image 'kaniko-warmer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.docker-credential-gcr;
#   name = "kaniko-warmer";
#   tag = "v${pkgs.docker-credential-gcr.version}";
#   entrypoint = [ "${pkgs.docker-credential-gcr}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kaniko-warmer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
