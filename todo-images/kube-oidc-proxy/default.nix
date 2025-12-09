{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-oidc-proxy
# Reference: https://images.chainguard.dev/directory/image/kube-oidc-proxy/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-oidc-proxy (1.0.9-r14)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)

# TODO: Implement kube-oidc-proxy image
throw "Image 'kube-oidc-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kube-oidc-proxy";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-oidc-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
