{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-cloudwatch-agent-start-amazon-cloudwatch-agent
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
  name = "amazon-cloudwatch-agent-start-amazon-cloudwatch-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "amazon cloudwatch agent start amazon cloudwatch agent";
      "org.opencontainers.image.description" = "amazon-cloudwatch-agent-start-amazon-cloudwatch-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
