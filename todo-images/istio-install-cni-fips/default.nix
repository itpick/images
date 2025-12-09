{ buildCLIImage, pkgs, lib, ... }:

# Image: istio-install-cni-fips
# Reference: https://images.chainguard.dev/directory/image/istio-install-cni-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ip6tables (1.8.11-r29)
#   istio-cni-fips-1.28 (1.28.1-r0)
#   istio-install-cni-fips-1.28 (1.28.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcrypto3-2.34 (3.6.0-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   xtables (1.8.11-r29)

# TODO: Implement istio-install-cni-fips image
throw "Image 'istio-install-cni-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "istio-install-cni-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "istio-install-cni-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
