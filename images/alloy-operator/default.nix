# alloy-operator
# =============
# Grafana Alloy Operator - Kubernetes Operator for Grafana Alloy
# https://github.com/grafana/alloy-operator

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Grafana Alloy Operator manages the lifecycle of Grafana Alloy instances

let
  version = "0.3.14";
  alloy-operator = buildGoModule {
    pname = "alloy-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "grafana";
      repo = "alloy-operator";
      rev = "alloy-operator-${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Grafana Alloy Operator - Kubernetes Operator for Grafana Alloy";
      homepage = "https://github.com/grafana/alloy-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = alloy-operator;
  name = "alloy-operator";
  tag = "v${version}";
  entrypoint = [ "${alloy-operator}/bin/alloy-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Alloy Operator";
    "org.opencontainers.image.description" = "Kubernetes Operator for managing Grafana Alloy instances";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "alloy";
  };
}
