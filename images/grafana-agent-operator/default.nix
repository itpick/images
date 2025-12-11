# grafana-agent-operator
# =============
# Grafana Agent Operator - Kubernetes Operator for Grafana Agent (deprecated)
# https://github.com/grafana/agent
# NOTE: Grafana Agent is deprecated. Consider migrating to Grafana Alloy.

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Grafana Agent Operator manages the lifecycle of Grafana Agent instances
# Deprecated: EOL November 1, 2025. Use Grafana Alloy instead.

let
  version = "0.44.6";
  grafana-agent-operator = buildGoModule {
    pname = "grafana-agent-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "grafana";
      repo = "agent";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/grafana-agent-operator" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/grafana/agent/pkg/build.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Grafana Agent Operator - Kubernetes Operator for Grafana Agent";
      homepage = "https://github.com/grafana/agent";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = grafana-agent-operator;
  name = "grafana-agent-operator";
  tag = "v${version}";
  entrypoint = [ "${grafana-agent-operator}/bin/grafana-agent-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Agent Operator";
    "org.opencontainers.image.description" = "Kubernetes Operator for managing Grafana Agent instances (deprecated)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "grafana-agent";
  };
}
