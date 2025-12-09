{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Kibana - visualization dashboard for Elasticsearch
# https://github.com/elastic/kibana

let
  kibanaPackages = with pkgs; [
    kibana
    bash
    busybox
    nodejs
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "kibana";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "kibana-root";
      paths = base.basePackages ++ kibanaPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath kibanaPackages}"
      "KIBANA_HOME=${pkgs.kibana}"
    ];
    ExposedPorts = {
      "5601/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Kibana visualization dashboard for Elasticsearch";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.kibana.version;
      "io.nix-containers.image.upstream" = "https://www.elastic.co/kibana/";
      "io.nix-containers.image.category" = "visualization";
      "io.nix-containers.image.aliases" = "kibana,elastic,dashboard";
    };
  };
}
