{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-kubeadm-bootstrap-controller-fips
# Reference: https://images.chainguard.dev/directory/image/cluster-api-kubeadm-bootstrap-controller-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-fips-1.9-kubeadm-bootstrap-controller (1.9.11-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cluster-api-kubeadm-bootstrap-controller-fips image
throw "Image 'cluster-api-kubeadm-bootstrap-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cluster-api-kubeadm-bootstrap-controller-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-kubeadm-bootstrap-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
