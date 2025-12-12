{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-monitor
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "neuvector-monitor";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "neuvector-monitor-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector monitor";
      "org.opencontainers.image.description" = "neuvector-monitor container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
