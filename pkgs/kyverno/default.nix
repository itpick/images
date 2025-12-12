{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kyverno/kyverno

buildGoModule rec {
  pname = "kyverno";
  version = "1.16.1";

  src = fetchFromGitHub {
    owner = "kyverno";
    repo = "kyverno";
    rev = "v${version}";
    hash = "sha256-frLuq91CWjyNSj5HFvYIsyR6NFvZqXLil3YQL5Tli6o=";
  };

  vendorHash = null;

  subPackages = [
    "cmd/kyverno"
    "cmd/cli/kubectl-kyverno"
    "cmd/cleanup-controller"
    "cmd/reports-controller"
    "cmd/background-controller"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kyverno/kyverno/pkg/version.BuildVersion=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Kubernetes native policy management";
    homepage = "https://kyverno.io/";
    license = licenses.asl20;
  };
}
