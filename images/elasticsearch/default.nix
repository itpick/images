{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Elasticsearch search and analytics engine
# https://github.com/elastic/elasticsearch

let
  elasticsearchPackages = with pkgs; [
    elasticsearch
    bash
    busybox
    coreutils
    curl
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "elasticsearch";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "elasticsearch-root";
      paths = base.basePackages ++ elasticsearchPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath elasticsearchPackages}"
      "ES_HOME=${pkgs.elasticsearch}"
      "ES_JAVA_HOME=${pkgs.elasticsearch.jre}"
    ];
    ExposedPorts = {
      "9200/tcp" = {};
      "9300/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Elasticsearch distributed search and analytics engine";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.elasticsearch.version;
      "io.nix-containers.image.upstream" = "https://www.elastic.co/elasticsearch/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "elasticsearch,elastic,search";
    };
  };
}
