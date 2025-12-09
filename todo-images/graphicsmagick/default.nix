{ buildCLIImage, pkgs, lib, ... }:

# Image: graphicsmagick
# Reference: https://images.chainguard.dev/directory/image/graphicsmagick/overview

# Packages available in nixpkgs:
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.graphicsmagick  # graphicsmagick (1.3.46-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libgomp (15.2.0-r6)
#   libltdl (2.5.4-r0)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   tiff (4.7.1-r0)

# TODO: Implement graphicsmagick image
throw "Image 'graphicsmagick' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.graphicsmagick;
#   name = "graphicsmagick";
#   tag = "v${pkgs.graphicsmagick.version}";
#   entrypoint = [ "${pkgs.graphicsmagick}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "graphicsmagick";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
