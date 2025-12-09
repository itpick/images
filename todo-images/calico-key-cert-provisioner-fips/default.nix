{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-key-cert-provisioner-fips
# Reference: https://images.chainguard.dev/directory/image/calico-key-cert-provisioner-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-key-cert-provisioner-fips-3.31 (3.31.2-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement calico-key-cert-provisioner-fips image
throw "Image 'calico-key-cert-provisioner-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "calico-key-cert-provisioner-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-key-cert-provisioner-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
