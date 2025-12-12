{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ip-masq-agent
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
  name = "ip-masq-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ip-masq-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ip masq agent";
      "org.opencontainers.image.description" = "ip-masq-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
