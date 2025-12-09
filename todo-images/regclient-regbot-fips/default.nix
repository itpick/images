{ buildCLIImage, pkgs, lib, ... }:

# Image: regclient-regbot-fips
# Reference: https://images.chainguard.dev/directory/image/regclient-regbot-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   regclient-regbot-fips (0.11.1-r0)

# TODO: Implement regclient-regbot-fips image
throw "Image 'regclient-regbot-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "regclient-regbot-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "regclient-regbot-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
