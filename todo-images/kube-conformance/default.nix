{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-conformance
# Reference: https://images.chainguard.dev/directory/image/kube-conformance/overview

# Packages available in nixpkgs:
#   pkgs.ginkgo  # ginkgo (2.27.2-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-conformance-1.34 (1.34.2-r1)
#   kubectl-1.34-default (1.34.2-r3)
#   ld-linux (2.42-r4)

# TODO: Implement kube-conformance image
throw "Image 'kube-conformance' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.ginkgo;
#   name = "kube-conformance";
#   tag = "v${pkgs.ginkgo.version}";
#   entrypoint = [ "${pkgs.ginkgo}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-conformance";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
