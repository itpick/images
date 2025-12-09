{ buildCLIImage, pkgs, lib, ... }:

# Image: dex-k8s-authenticator
# Reference: https://images.chainguard.dev/directory/image/dex-k8s-authenticator/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   dex-k8s-authenticator (1.4.0-r22)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement dex-k8s-authenticator image
throw "Image 'dex-k8s-authenticator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "dex-k8s-authenticator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dex-k8s-authenticator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
