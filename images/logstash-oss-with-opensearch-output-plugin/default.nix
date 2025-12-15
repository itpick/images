{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# logstash-oss-with-opensearch-output-plugin
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "logstash-oss-with-opensearch-output-plugin";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "logstash-oss-with-opensearch-output-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "logstash-oss-with-opensearch-output-plugin";
      "org.opencontainers.image.description" = "logstash-oss-with-opensearch-output-plugin container image";
    };
  };
}
