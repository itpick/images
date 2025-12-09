{ buildCLIImage, pkgs, lib, ... }:

# Image: istio-proxy-fips
# Reference: https://images.chainguard.dev/directory/image/istio-proxy-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnetfilter_conntrack  # libnetfilter_conntrack (1.1.0-r4)
#   pkgs.libnfnetlink  # libnfnetlink (1.0.2-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   boringssl-fips-static-2023042800-tools (2023042800-r7)
#   ip6tables (1.8.11-r29)
#   istio-envoy-fips-1.28 (1.28.0-r0)
#   istio-pilot-agent-fips-1.28 (1.28.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   xtables (1.8.11-r29)

# TODO: Implement istio-proxy-fips image
throw "Image 'istio-proxy-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "istio-proxy-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "istio-proxy-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
