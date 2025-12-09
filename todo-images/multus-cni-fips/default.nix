{ buildCLIImage, pkgs, lib, ... }:

# Image: multus-cni-fips
# Reference: https://images.chainguard.dev/directory/image/multus-cni-fips/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   multus-cni-fips (4.2.3-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement multus-cni-fips image
throw "Image 'multus-cni-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "multus-cni-fips";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "multus-cni-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
