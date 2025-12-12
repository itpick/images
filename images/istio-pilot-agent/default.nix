{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# istio-pilot-agent
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
  name = "istio-pilot-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "istio-pilot-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "istio pilot agent";
      "org.opencontainers.image.description" = "istio-pilot-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
