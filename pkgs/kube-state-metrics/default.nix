{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/kube-state-metrics

buildGoModule rec {
  pname = "kube-state-metrics";
  version = "2.19.1";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "kube-state-metrics";
    rev = "v${version}";
    hash = "sha256-PZC3ZiVnChy7IdibZKB3IRv8+1AfmvAWY7RquwTcS1Y=";
  };

  vendorHash = "sha256-vmmXEDzkv+ZQaKJ6++HpPHj2M9gaquonNjXG2DOlxwI=";

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
