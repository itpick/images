{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-web-fips
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-web-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-dashboard-web-fips (1.7.0-r6)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kubernetes-dashboard-web-fips image
throw "Image 'kubernetes-dashboard-web-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubernetes-dashboard-web-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-web-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
