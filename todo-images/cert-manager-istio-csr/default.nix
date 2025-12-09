{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-istio-csr
# Reference: https://images.chainguard.dev/directory/image/cert-manager-istio-csr/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cert-manager-istio-csr image
throw "Image 'cert-manager-istio-csr' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cert-manager-istio-csr";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-istio-csr";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
