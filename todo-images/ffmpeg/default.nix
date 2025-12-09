{ buildCLIImage, pkgs, lib, ... }:

# Image: ffmpeg
# Reference: https://images.chainguard.dev/directory/image/ffmpeg/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.cairo  # cairo (1.18.4-r1)
#   pkgs.ffmpeg  # ffmpeg-8.0 (8.0.1-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.graphite2  # graphite2 (1.3.14-r6)
#   pkgs.harfbuzz  # harfbuzz (12.2.0-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libogg  # libogg (1.3.6-r2)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsodium  # libsodium (1.0.20-r2)
#   pkgs.libssh  # libssh (0.11.3-r0)
#   pkgs.libtheora  # libtheora (1.2.0-r1)
#   pkgs.libvorbis  # libvorbis (1.3.7-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openjpeg  # openjpeg (2.5.4-r0)
#   pkgs.pixman  # pixman (0.46.4-r0)
#   pkgs.snappy  # snappy (1.2.2-r1)
#   pkgs.soxr  # soxr (0.1.3-r4)
#   pkgs.speex  # speex (1.2.1-r5)
#   pkgs.svt-av1  # svt-av1 (3.1.2-r0)
#   pkgs.x264  # x264 (2025.06.08-r2)
#   pkgs.x265  # x265 (4.1-r5)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zeromq  # zeromq (4.3.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aom-libs (3.13.1-r0)
#   ffmpeg-8.0-libavcodec62 (8.0.1-r0)
#   ffmpeg-8.0-libavdevice62 (8.0.1-r0)
#   ffmpeg-8.0-libavfilter11 (8.0.1-r0)
#   ffmpeg-8.0-libavformat62 (8.0.1-r0)
#   ffmpeg-8.0-libavutil60 (8.0.1-r0)
#   ffmpeg-8.0-libswresample6 (8.0.1-r0)
#   ffmpeg-8.0-libswscale9 (8.0.1-r0)
#   fontconfig-config (2.17.1-r1)
#   jitterentropy-library (3.6.3-r2)
#   jitterentropy-library-dev (3.6.3-r2)
#   lame-libs (3.100-r2)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libdav1d (1.5.2-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgomp (15.2.0-r6)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libsdl2 (2.32.10-r0)
#   libsrt (1.5.4-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-dev (3.6.0-r4)
#   opus (1.5.2-r2)

# TODO: Implement ffmpeg image
throw "Image 'ffmpeg' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.ffmpeg;
#   name = "ffmpeg";
#   tag = "v${pkgs.ffmpeg.version}";
#   entrypoint = [ "${pkgs.ffmpeg}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ffmpeg";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
