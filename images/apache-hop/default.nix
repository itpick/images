{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-hop
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
  name = "apache-hop";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-hop-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apache hop";
      "org.opencontainers.image.description" = "apache-hop container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
