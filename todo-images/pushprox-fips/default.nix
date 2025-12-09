{ buildCLIImage, pkgs, lib, ... }:

# Image: pushprox-fips
# Reference: https://images.chainguard.dev/directory/image/pushprox-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   pushprox-client-fips (0.2.0-r4)
#   pushprox-fips (0.2.0-r4)

# TODO: Implement pushprox-fips image
throw "Image 'pushprox-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "pushprox-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "pushprox-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
