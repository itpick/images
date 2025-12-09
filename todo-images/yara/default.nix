{ buildCLIImage, pkgs, lib, ... }:

# Image: yara
# Reference: https://images.chainguard.dev/directory/image/yara/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.yara  # yara (4.5.5-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libmagic (5.46-r4)

# TODO: Implement yara image
throw "Image 'yara' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.yara;
#   name = "yara";
#   tag = "v${pkgs.yara.version}";
#   entrypoint = [ "${pkgs.yara}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "yara";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
