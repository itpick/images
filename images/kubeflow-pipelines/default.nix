# kubeflow-pipelines
# =============
# Kubeflow Pipelines - ML workflow orchestration for Kubeflow
# https://github.com/kubeflow/pipelines

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Kubeflow Pipelines API Server - handles pipeline orchestration

let
  version = "2.15.0";
  kubeflow-pipelines = buildGoModule {
    pname = "kubeflow-pipelines";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "backend/src/apiserver" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/apiserver $out/bin/kubeflow-pipelines-apiserver
    '';

    meta = with lib; {
      description = "Kubeflow Pipelines API Server";
      homepage = "https://github.com/kubeflow/pipelines";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kubeflow-pipelines;
  name = "kubeflow-pipelines";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-pipelines}/bin/kubeflow-pipelines-apiserver" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  env = {
    POD_NAMESPACE = "kubeflow";
  };

  labels = {
    "org.opencontainers.image.title" = "Kubeflow Pipelines";
    "org.opencontainers.image.description" = "ML workflow orchestration for Kubeflow";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow-pipelines";
  };
}
