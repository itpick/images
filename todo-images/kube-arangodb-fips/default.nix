{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-arangodb-fips
# Reference: https://images.chainguard.dev/directory/image/kube-arangodb-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   boringssl-fips-static-2023042800-tools (2023042800-r7)
#   envoy-fips-1.36 (1.36.3-r0)
#   kube-arangodb-fips-1.3 (1.3.3-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kube-arangodb-fips image
throw "Image 'kube-arangodb-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kube-arangodb-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-arangodb-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
