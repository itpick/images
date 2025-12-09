{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-cainjector-iamguarded
# Reference: https://images.chainguard.dev/directory/image/cert-manager-cainjector-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.procps  # procps (4.0.5-r42)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libproc-2-0 (4.0.5-r42)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement cert-manager-cainjector-iamguarded image
throw "Image 'cert-manager-cainjector-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cert-manager-cainjector-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-cainjector-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
