{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mcp-grafana
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
  name = "mcp-grafana";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "mcp-grafana-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mcp-grafana";
      "org.opencontainers.image.description" = "mcp-grafana container image";
    };
  };
}
