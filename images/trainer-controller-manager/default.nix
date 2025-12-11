# trainer-controller-manager
# =============
# Kubeflow Trainer Controller Manager - Distributed ML training on Kubernetes
# https://github.com/kubeflow/trainer

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Kubeflow Trainer enables scalable, distributed training of ML models

let
  version = "2.1.0";
  trainer-controller = buildGoModule {
    pname = "trainer-controller-manager";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "trainer";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/trainer-controller-manager" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kubeflow/trainer/pkg/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubeflow Trainer Controller Manager for distributed ML training";
      homepage = "https://github.com/kubeflow/trainer";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = trainer-controller;
  name = "trainer-controller-manager";
  tag = "v${version}";
  entrypoint = [ "${trainer-controller}/bin/trainer-controller-manager" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kubeflow Trainer Controller Manager";
    "org.opencontainers.image.description" = "Distributed ML training controller for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow-trainer";
  };
}
