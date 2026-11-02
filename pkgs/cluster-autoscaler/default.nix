{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler

buildGoModule rec {
  pname = "cluster-autoscaler";
  version = "cluster-autoscaler-1.37.0";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "autoscaler";
    rev = "cluster-autoscaler-${version}";
    hash = "sha256-Yt0bpkYFDi7jAOn1lCSPzttX3H5BaxrrZI6Ljy5YKTY=";
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
