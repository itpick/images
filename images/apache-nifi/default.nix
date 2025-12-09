{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # From Chainguard SBOM - packages available in nixpkgs
  nifiPackages = with pkgs; [
    apache-nifi  # Custom package from pkgs/apache-nifi
    openjdk21
    bash
    busybox
    coreutils
    # Graphics/UI dependencies
    alsa-lib
    freetype
    giflib
    lcms2
    libjpeg_turbo
    libpng
    libxml2
    libxslt
    # X11 dependencies
    xorg.libX11
    xorg.libXau
    xorg.libxcb
    xorg.libXdmcp
    xorg.libXext
    xorg.libXi
    xorg.libXrender
    xorg.libXtst
    # Other dependencies
    libffi
    libtasn1
    libuuid
    mpdecimal
    zlib
    python3
    readline
    sqlite
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "apache-nifi";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "apache-nifi-root";
      paths = base.basePackages ++ nifiPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nifiPackages}"
      "JAVA_HOME=${pkgs.openjdk21}"
      "NIFI_HOME=/opt/nifi"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
      "8443/tcp" = {};
      "10000/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Apache NiFi - data flow automation";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.apache-nifi.version;
      "io.nix-containers.image.upstream" = "https://nifi.apache.org/";
      "io.nix-containers.image.category" = "data-flow";
      "io.nix-containers.image.aliases" = "nifi,dataflow,etl";
    };
  };
}
