{ buildCLIImage, pkgs, lib, ... }:

# Image: kubelet-csr-approver
# Reference: https://images.chainguard.dev/directory/image/kubelet-csr-approver/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubelet-csr-approver (1.2.12-r0)

# TODO: Implement kubelet-csr-approver image
throw "Image 'kubelet-csr-approver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubelet-csr-approver";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubelet-csr-approver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
