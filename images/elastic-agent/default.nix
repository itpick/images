{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# elastic-agent
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
  name = "elastic-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "elastic-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "elastic agent";
      "org.opencontainers.image.description" = "elastic-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
