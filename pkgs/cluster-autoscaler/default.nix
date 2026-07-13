{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler

buildGoModule rec {
  pname = "cluster-autoscaler";
  version = "cluster-autoscaler-chart-9.58.0";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "autoscaler";
    rev = "cluster-autoscaler-${version}";
    hash = "sha256-81OKhrmUsl8aP6w0XqQmBFpJ4Gcqg9nYvgAUxszfE1M=";
  };

  vendorHash = null;

  subPackages = [ "cluster-autoscaler" ];

  env.CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" ];

  doCheck = false;

  meta = with lib; {
    description = "Cluster Autoscaler automatically adjusts the size of a Kubernetes cluster";
    homepage = "https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler";
    license = licenses.asl20;
  };
}
