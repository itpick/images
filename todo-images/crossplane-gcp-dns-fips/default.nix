{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-dns-fips
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-dns-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-dns-fips (2.3.0-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement crossplane-gcp-dns-fips image
throw "Image 'crossplane-gcp-dns-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "crossplane-gcp-dns-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-dns-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
