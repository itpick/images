{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-k8s-cni-fips
# Reference: https://images.chainguard.dev/directory/image/amazon-k8s-cni-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   amazon-k8s-cni-fips (1.20.5-r1)
#   iptables-wrappers (2-r4)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcrypto3-2.34 (3.6.0-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   xtables (1.8.11-r29)

# TODO: Implement amazon-k8s-cni-fips image
throw "Image 'amazon-k8s-cni-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "amazon-k8s-cni-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-k8s-cni-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
