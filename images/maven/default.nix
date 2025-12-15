{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for maven:
# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.maven  # maven-3.9 (3.9.11-r1)
#   pkgs.openjdk  # openjdk-25 (25.0.1-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ca-certificates (20251003-r0)
#   java-cacerts (20251003-r0)
#   java-common (0.2-r2)
#   java-common-jre (0.2-r2)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openjdk-25-default-jdk (25.0.1-r1)
#   p11-kit-trust (0.25.10-r0)
#   ttf-dejavu (2.37-r7)

let
  mavenPackages = with pkgs; [
    maven
    openjdk21
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "maven";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "maven-root";
      paths = base.basePackages ++ mavenPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mavenPackages}"
      "JAVA_HOME=${pkgs.openjdk21}"
      "MAVEN_CONFIG=/home/nonroot/.m2"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.description" = "Apache Maven build automation tool";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.maven.version;
      "io.nix-containers.image.upstream" = "https://maven.apache.org/";
      "io.nix-containers.image.category" = "build-env";
      "io.nix-containers.image.aliases" = "maven,mvn,java-build";
    };
  };
}