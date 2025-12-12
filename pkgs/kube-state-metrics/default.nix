{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/kube-state-metrics

buildGoModule rec {
  pname = "kube-state-metrics";
  version = "2.17.0";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "kube-state-metrics";
    rev = "v${version}";
    hash = "sha256-w55FOWw9p7yV/bt4leZucOLqjVyHYFF+gVLWLGQKF9M=";
  };

  vendorHash = "sha256-pcoqeYyOehFNkwD4fWqrk9725BJkv+8sKy1NLv+HJPE=";

  subPackages = [ "." ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X k8s.io/kube-state-metrics/v2/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Generate metrics from Kubernetes API objects";
    homepage = "https://github.com/kubernetes/kube-state-metrics";
    license = licenses.asl20;
  };
}
