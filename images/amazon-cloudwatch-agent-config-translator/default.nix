{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-cloudwatch-agent-config-translator
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
  name = "amazon-cloudwatch-agent-config-translator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "amazon-cloudwatch-agent-config-translator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "amazon cloudwatch agent config translator";
      "org.opencontainers.image.description" = "amazon-cloudwatch-agent-config-translator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
