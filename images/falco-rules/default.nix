{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco-rules
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
  name = "falco-rules";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "falco-rules-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falco rules";
      "org.opencontainers.image.description" = "falco-rules container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
