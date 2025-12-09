{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-channel-controller-fips
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-channel-controller-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-fips-1.19-channel-controller (1.19.8-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement knative-eventing-channel-controller-fips image
throw "Image 'knative-eventing-channel-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "knative-eventing-channel-controller-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-channel-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
