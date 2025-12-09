{ buildCLIImage, pkgs, lib, ... }:

# Image: vault-secrets-operator
# Reference: https://images.chainguard.dev/directory/image/vault-secrets-operator/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   vault-secrets-operator (1.0.1-r3)

# TODO: Implement vault-secrets-operator image
throw "Image 'vault-secrets-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "vault-secrets-operator";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vault-secrets-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
