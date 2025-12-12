{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opensearch-dashboards-3-dashboards-reporting
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
  name = "opensearch-dashboards-3-dashboards-reporting";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "opensearch-dashboards-3-dashboards-reporting-root";
      paths = base.basePackages ++ opensearchPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opensearch dashuoards 3 dashuoards reporting";
      "org.opencontainers.image.description" = "OpenSearch opensearch-dashboards-3-dashboards-reporting";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "opensearch";
    };
  };
}
