{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler

buildGoModule rec {
  pname = "vertical-pod-autoscaler";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "autoscaler";
    rev = "vertical-pod-autoscaler-${version}";
    hash = "sha256-avWknl7hNvLMa6HaJ3nh54o1sJ4GEkTA4cMqIpkdPKo=";
  };

  vendorHash = null;

  subPackages = [
    "vertical-pod-autoscaler/pkg/admission-controller"
    "vertical-pod-autoscaler/pkg/recommender"
    "vertical-pod-autoscaler/pkg/updater"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" ];

  doCheck = false;

  meta = with lib; {
    description = "Vertical Pod Autoscaler automatically adjusts pod resources";
    homepage = "https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler";
    license = licenses.asl20;
  };
}
