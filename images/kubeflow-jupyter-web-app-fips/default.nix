{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-jupyter-web-app-fips
# Kubeflow ML platform component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "kubeflow-jupyter-web-app-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kubeflow-jupyter-web-app-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubeflow-jupyter-web-app" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow-jupyter-web-app-fips";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-jupyter-web-app";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
