{ buildCLIImage, pkgs, lib, ... }:

# Image: oauth2-proxy-fips
# Reference: https://images.chainguard.dev/directory/image/oauth2-proxy-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   oauth2-proxy-fips (7.13.0-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement oauth2-proxy-fips image
throw "Image 'oauth2-proxy-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "oauth2-proxy-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "oauth2-proxy-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
