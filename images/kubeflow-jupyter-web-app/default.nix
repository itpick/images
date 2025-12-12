{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-jupyter-web-app
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-jupyter-web-app";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kubeflow-component;
  name = "kubeflow-jupyter-web-app";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/jupyter-web-app" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow jupyter web app";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-jupyter-web-app";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
