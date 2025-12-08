{ buildCLIImage, fetchFromGitHub, python3Packages, lib, ... }:

let
  version = "1.28.0";
  k8s-sidecar = python3Packages.buildPythonApplication {
    pname = "k8s-sidecar";
    inherit version;
    format = "pyproject";

    src = fetchFromGitHub {
      owner = "kiwigrid";
      repo = "k8s-sidecar";
      rev = version;
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    nativeBuildInputs = with python3Packages; [
      setuptools
    ];

    propagatedBuildInputs = with python3Packages; [
      requests
      kubernetes
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes sidecar to collect ConfigMaps and Secrets";
      homepage = "https://github.com/kiwigrid/k8s-sidecar";
      license = licenses.mit;
    };
  };

in
buildCLIImage {
  drv = k8s-sidecar;
  name = "k8s-sidecar";
  tag = "v${version}";
  entrypoint = [ "${k8s-sidecar}/bin/sidecar" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "K8s Sidecar";
    "org.opencontainers.image.description" = "Kubernetes sidecar to collect ConfigMaps and Secrets";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
