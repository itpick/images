{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-receive-controller-fips
# Reference: https://images.chainguard.dev/directory/image/thanos-receive-controller-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   thanos-receive-controller-fips (0_git20251112-r2)

# TODO: Implement thanos-receive-controller-fips image
throw "Image 'thanos-receive-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "thanos-receive-controller-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-receive-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
