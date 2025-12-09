{ buildCLIImage, pkgs, lib, ... }:

# Image: multus-cni
# Reference: https://images.chainguard.dev/directory/image/multus-cni/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.multus-cni  # multus-cni (4.2.3-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)

# TODO: Implement multus-cni image
throw "Image 'multus-cni' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.multus-cni;
#   name = "multus-cni";
#   tag = "v${pkgs.multus-cni.version}";
#   entrypoint = [ "${pkgs.multus-cni}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "multus-cni";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
