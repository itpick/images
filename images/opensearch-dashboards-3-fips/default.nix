{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opensearch-dashboards-3-fips
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
  name = "opensearch-dashboards-3-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "opensearch-dashboards-3-fips-root";
      paths = base.basePackages ++ opensearchPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "opensearch dashuoards 3";
      "org.opencontainers.image.description" = "OpenSearch opensearch-dashboards-3";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "opensearch";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
