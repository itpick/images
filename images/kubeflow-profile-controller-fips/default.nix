{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-profile-controller-fips
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-profile-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "${version}";
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
  drv = kubeflow-component;
  name = "kubeflow-profile-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/profile-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow profile controller";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-profile-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
