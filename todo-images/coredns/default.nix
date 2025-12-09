{ buildCLIImage, pkgs, lib, ... }:

# Image: coredns
# Reference: https://images.chainguard.dev/directory/image/coredns/overview

# Packages available in nixpkgs:
#   pkgs.coredns  # coredns-1.13 (1.13.1-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement coredns image
throw "Image 'coredns' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.coredns;
#   name = "coredns";
#   tag = "v${pkgs.coredns.version}";
#   entrypoint = [ "${pkgs.coredns}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "coredns";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
