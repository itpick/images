{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

# Grafana Operator - Kubernetes operator for Grafana
# https://github.com/grafana/grafana-operator

let
  version = "5.20.0";
  grafana-operator = buildGoModule {
    pname = "grafana-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "grafana";
      repo = "grafana-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/manager" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/grafana/grafana-operator/v5/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes operator for managing Grafana instances";
      homepage = "https://github.com/grafana/grafana-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = grafana-operator;
  name = "grafana-operator";
  tag = "v${version}";
  entrypoint = [ "${grafana-operator}/bin/manager" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Grafana Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for managing Grafana instances";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "grafana-operator";
  };
}
