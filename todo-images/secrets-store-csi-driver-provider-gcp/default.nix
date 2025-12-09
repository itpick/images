{ buildCLIImage, pkgs, lib, ... }:

# Image: secrets-store-csi-driver-provider-gcp
# Reference: https://images.chainguard.dev/directory/image/secrets-store-csi-driver-provider-gcp/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   secrets-store-csi-driver-provider-gcp (1.10.0-r0)

# TODO: Implement secrets-store-csi-driver-provider-gcp image
throw "Image 'secrets-store-csi-driver-provider-gcp' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "secrets-store-csi-driver-provider-gcp";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "secrets-store-csi-driver-provider-gcp";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
