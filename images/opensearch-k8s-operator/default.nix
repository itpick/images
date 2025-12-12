{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opensearch-k8s-operator
# OpenSearch search and analytics

let
  version = "2.19.0";
  
  opensearchPkgs = with pkgs; [
    opensearch
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "opensearch-k8s-operator";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "opensearch-k8s-operator-root";
      paths = base.basePackages ++ opensearchPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opensearch k8s operator";
      "org.opencontainers.image.description" = "OpenSearch opensearch-k8s-operator";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "opensearch";
    };
  };
}
