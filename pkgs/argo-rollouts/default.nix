{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/argoproj/argo-rollouts

buildGoModule rec {
  pname = "argo-rollouts";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-rollouts";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/rollouts-controller"
    "cmd/kubectl-argo-rollouts"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj/argo-rollouts/utils/version.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Progressive Delivery for Kubernetes";
    homepage = "https://argoproj.github.io/argo-rollouts/";
    license = licenses.asl20;
  };
}
