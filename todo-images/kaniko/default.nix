{ buildCLIImage, pkgs, lib, ... }:

# Image: kaniko
# Reference: https://images.chainguard.dev/directory/image/kaniko/overview

# Packages available in nixpkgs:
#   pkgs.docker-credential-gcr  # docker-credential-gcr (2.1.30-r7)
#   pkgs.kaniko  # kaniko (1.25.5-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   docker-credential-acr-env (0.7.0-r27)
#   docker-credential-ecr-login (0.11.0-r1)

# TODO: Implement kaniko image
throw "Image 'kaniko' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kaniko;
#   name = "kaniko";
#   tag = "v${pkgs.kaniko.version}";
#   entrypoint = [ "${pkgs.kaniko}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kaniko";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
