{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# logstash-8.19-with-output-opensearch
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
  name = "logstash-8.19-with-output-opensearch";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "logstash-8.19-with-output-opensearch-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "logstash 8.19 with output opensearch";
      "org.opencontainers.image.description" = "logstash-8.19-with-output-opensearch container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
