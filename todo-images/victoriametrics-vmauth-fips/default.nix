{ buildCLIImage, pkgs, lib, ... }:

# Image: victoriametrics-vmauth-fips
# Reference: https://images.chainguard.dev/directory/image/victoriametrics-vmauth-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   victoriametrics-vmauth-fips (1.131.0-r1)

# TODO: Implement victoriametrics-vmauth-fips image
throw "Image 'victoriametrics-vmauth-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "victoriametrics-vmauth-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoriametrics-vmauth-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
