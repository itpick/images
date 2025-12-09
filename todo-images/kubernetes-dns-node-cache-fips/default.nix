{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dns-node-cache-fips
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dns-node-cache-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   iptables-wrappers (2-r4)
#   kubernetes-dns-node-cache-fips (1.26.7-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   xtables (1.8.11-r29)

# TODO: Implement kubernetes-dns-node-cache-fips image
throw "Image 'kubernetes-dns-node-cache-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubernetes-dns-node-cache-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dns-node-cache-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
