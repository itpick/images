{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opensearch-dashboards-fips
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
  name = "opensearch-dashboards-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "opensearch-dashboards-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opensearch-dashboards-fips";
      "org.opencontainers.image.description" = "opensearch-dashboards-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
