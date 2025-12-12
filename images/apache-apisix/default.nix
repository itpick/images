{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-apisix
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
  name = "apache-apisix";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-apisix-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apache apisix";
      "org.opencontainers.image.description" = "apache-apisix container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
