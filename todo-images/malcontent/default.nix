{ buildCLIImage, pkgs, lib, ... }:

# Image: malcontent
# Reference: https://images.chainguard.dev/directory/image/malcontent/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.malcontent  # malcontent (1.18.1-r0)
#   pkgs.yara-x  # yara-x (1.10.0-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement malcontent image
throw "Image 'malcontent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.malcontent;
#   name = "malcontent";
#   tag = "v${pkgs.malcontent.version}";
#   entrypoint = [ "${pkgs.malcontent}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "malcontent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
