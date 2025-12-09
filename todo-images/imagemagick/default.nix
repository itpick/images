{ buildCLIImage, pkgs, lib, ... }:

# Image: imagemagick
# Reference: https://images.chainguard.dev/directory/image/imagemagick/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.brotli  # brotli (1.2.0-r1)
#   pkgs.cairo  # cairo (1.18.4-r1)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.fribidi  # fribidi (1.0.16-r2)
#   pkgs.gdk-pixbuf  # gdk-pixbuf (2.44.4-r0)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glycin-loaders  # glycin-2 (2.0.7-r0)
#   pkgs.graphene  # graphene (1.10.8-r6)
#   pkgs.graphite2  # graphite2 (1.3.14-r6)
#   pkgs.gtk-mac-integration  # gtk-4 (4.21.3-r0)
#   pkgs.harfbuzz  # harfbuzz (12.2.0-r0)
#   pkgs.imagemagick  # imagemagick-7 (7.1.2.9-r0)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libdrm  # libdrm (2.4.129-r0)
#   pkgs.libepoxy  # libepoxy (1.5.10-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libglvnd  # libglvnd (1.7.0-r6)
#   pkgs.libheif  # libheif (1.20.2-r4)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libjxl  # libjxl (0.10.4_git20251124-r0)
#   pkgs.libogg  # libogg (1.3.6-r2)
#   pkgs.libpciaccess  # libpciaccess (0.18.1-r4)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.librsvg  # librsvg (2.61.3-r0)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtheora  # libtheora (1.2.0-r1)
#   pkgs.libvorbis  # libvorbis (1.3.7-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcursor  # libxcursor (1.2.3-r2)
#   pkgs.libxdamage  # libxdamage (1.1.6-r3)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxfixes  # libxfixes (6.0.2-r0)
#   pkgs.libxft  # libxft (2.3.9-r1)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxinerama  # libxinerama (1.1.5-r3)
#   pkgs.libxkbcommon  # libxkbcommon (1.13.1-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxrandr  # libxrandr (1.5.4-r3)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxv  # libxv (1.0.13-r2)
#   pkgs.openh264  # openh264 (2.6.0-r1)
#   pkgs.openjpeg  # openjpeg (2.5.4-r0)
#   pkgs.orc  # orc (0.4.41-r2)
#   pkgs.pango  # pango (1.56.4-r1)
#   pkgs.pixman  # pixman (0.46.4-r0)
#   pkgs.rav1e  # rav1e (0.8.1-r1)
#   pkgs.shared-mime-info  # shared-mime-info (2.4-r6)
#   pkgs.svt-av1  # svt-av1 (3.1.2-r0)
#   pkgs.vulkan-loader  # vulkan-loader (1.4.335-r0)
#   pkgs.x265  # x265 (4.1-r5)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   brotli-dev (1.2.0-r1)
#   cairo-gobject (1.18.4-r1)
#   fontconfig-config (2.17.1-r1)
#   gst-plugins-bad (1.27.2-r2)
#   gst-plugins-base (1.27.2-r0)
#   gstreamer (1.27.2-r2)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libdav1d (1.5.2-r0)
#   libde256 (1.0.16-r1)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgomp (15.2.0-r6)
#   libmount (2.41.2-r2)
#   libopenjph0.25 (0.25.3-r0)
#   libpcre2-8-0 (10.47-r0)
#   libsdl2 (2.32.10-r0)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   opus (1.5.2-r2)
#   tiff (4.7.1-r0)
#   wayland-libs-client (1.24.0-r2)
#   wayland-libs-egl (1.24.0-r2)

# TODO: Implement imagemagick image
throw "Image 'imagemagick' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.imagemagick;
#   name = "imagemagick";
#   tag = "v${pkgs.imagemagick.version}";
#   entrypoint = [ "${pkgs.imagemagick}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "imagemagick";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
