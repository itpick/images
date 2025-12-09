{ buildCLIImage, pkgs, lib, ... }:

# Image: sonar-scanner-cli
# Reference: https://images.chainguard.dev/directory/image/sonar-scanner-cli/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-18 (18.20.8-r5)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.pylint  # pylint (4.0.4-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.sonar-scanner-cli  # sonar-scanner-cli-5 (5.0.2.4997-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   icu78-data-full (78.1-r0)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libicu78 (78.1-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-17-default-jvm (17.0.17-r2)
#   openjdk-17-jre (17.0.17-r2)
#   p11-kit-trust (0.25.10-r0)
#   py3-pip-wheel (25.3-r2)
#   py3.13-astroid (4.0.2-r0)
#   py3.13-dill (0.4.0-r2)
#   py3.13-isort (7.0.0-r0)
#   py3.13-platformdirs (4.5.0-r0)
#   py3.13-tomlkit (0.13.3-r2)
#   py3.13-typing-extensions (4.15.0-r0)
#   python-3.13-base (3.13.11-r0)
#   sonar-scanner-cli-entrypoint (11.5.0.2154.7.3.0-r0)
#   sqlite-libs (3.51.1-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement sonar-scanner-cli image
throw "Image 'sonar-scanner-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.sonar-scanner-cli;
#   name = "sonar-scanner-cli";
#   tag = "v${pkgs.sonar-scanner-cli.version}";
#   entrypoint = [ "${pkgs.sonar-scanner-cli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "sonar-scanner-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
