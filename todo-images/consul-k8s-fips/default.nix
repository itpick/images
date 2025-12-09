{ buildCLIImage, pkgs, lib, ... }:

# Image: consul-k8s-fips
# Reference: https://images.chainguard.dev/directory/image/consul-k8s-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   consul-k8s-fips-1.7 (1.7.8-r0)
#   go-discover-fips (0_git20251128-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement consul-k8s-fips image
throw "Image 'consul-k8s-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "consul-k8s-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "consul-k8s-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
