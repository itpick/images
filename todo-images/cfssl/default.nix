{ buildCLIImage, pkgs, lib, ... }:

# Image: cfssl
# Reference: https://images.chainguard.dev/directory/image/cfssl/overview

# Packages available in nixpkgs:
#   pkgs.cfssl  # cfssl (1.6.5-r25)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cfssl image
throw "Image 'cfssl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cfssl;
#   name = "cfssl";
#   tag = "v${pkgs.cfssl.version}";
#   entrypoint = [ "${pkgs.cfssl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cfssl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
