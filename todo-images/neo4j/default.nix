{ buildCLIImage, pkgs, lib, ... }:

# Image: neo4j
# Reference: https://images.chainguard.dev/directory/image/neo4j/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.neo4j  # neo4j-2025.10 (2025.10.1-r1)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.su-exec  # su-exec (0.3-r0)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   neo4j-2025.10-browser (2025.10.1-r1)
#   openjdk-21-default-jvm (21.0.9-r2)
#   openjdk-21-jre (21.0.9-r2)
#   p11-kit-trust (0.25.10-r0)
#   sed (4.9-r6)
#   ttf-dejavu (2.37-r7)

# TODO: Implement neo4j image
throw "Image 'neo4j' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.neo4j;
#   name = "neo4j";
#   tag = "v${pkgs.neo4j.version}";
#   entrypoint = [ "${pkgs.neo4j}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "7474";
#
#   labels = {
#     "org.opencontainers.image.title" = "neo4j";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
