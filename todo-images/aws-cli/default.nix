{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-cli
# Reference: https://images.chainguard.dev/directory/image/aws-cli/overview

# Packages available in nixpkgs:
#   pkgs.awscli  # aws-cli-2 (2.32.10-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   groff-base (1.23.0-r7)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libexpat1 (2.7.3-r0)
#   libstdc++ (15.2.0-r6)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement aws-cli image
throw "Image 'aws-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.awscli;
#   name = "aws-cli";
#   tag = "v${pkgs.awscli.version}";
#   entrypoint = [ "${pkgs.awscli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
