# loki-helm-test
# =============
# Test image for Loki Helm chart that includes tools for testing Loki deployments
# Used in Helm chart test hooks

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Chainguard SBOM packages for loki-helm-test:
# Packages available in nixpkgs:
#   pkgs.helm  # helm-4 (4.0.1-r2)

let
  testPackages = with pkgs; [
    grafana-loki  # Includes logcli for testing
    curl
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "loki-helm-test";
  tag = pkgs.grafana-loki.version;

  copyToRoot = [
    (buildEnv {
      name = "loki-helm-test-root";
      paths = base.basePackages ++ testPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath testPackages}"
    ];
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Test image for Loki Helm chart";
      "org.opencontainers.image.version" = pkgs.grafana-loki.version;
      "io.nix-containers.chart" = "loki";
    };
  };
}
