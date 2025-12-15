{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# logstash-9.2-env2yaml
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
  name = "logstash-9.2-env2yaml";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "logstash-9.2-env2yaml-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "logstash 9.2 env2yaml";
      "org.opencontainers.image.description" = "logstash-9.2-env2yaml container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
