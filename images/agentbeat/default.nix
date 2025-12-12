{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# agentbeat
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
  name = "agentbeat";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "agentbeat-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "agentueat";
      "org.opencontainers.image.description" = "agentbeat container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
