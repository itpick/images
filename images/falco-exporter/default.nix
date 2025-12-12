{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco-exporter
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
  name = "falco-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "falco-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falco exporter";
      "org.opencontainers.image.description" = "falco-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
