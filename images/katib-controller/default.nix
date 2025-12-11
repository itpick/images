# katib-controller
# =============
# Katib Controller - Hyperparameter tuning controller for Kubernetes
# https://github.com/kubeflow/katib

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Katib is Kubernetes-native AutoML system for hyperparameter tuning

let
  version = "0.19.0";
  katib-controller = buildGoModule {
    pname = "katib-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "katib";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/katib-controller" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Katib Controller - Hyperparameter tuning for Kubernetes";
      homepage = "https://github.com/kubeflow/katib";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = katib-controller;
  name = "katib-controller";
  tag = "v${version}";
  entrypoint = [ "${katib-controller}/bin/katib-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Katib Controller";
    "org.opencontainers.image.description" = "Hyperparameter tuning controller for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "katib";
  };
}
