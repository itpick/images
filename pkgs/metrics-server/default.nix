{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/metrics-server

buildGoModule rec {
  pname = "metrics-server";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "metrics-server";
    rev = "v${version}";
    hash = "sha256-KyXQ2+CnOiohwu4YnzK6UUWwqpd+rgd8uXAExpe/new=";
  };

  vendorHash = "sha256-wMaEF1hkVUjubvv4RCFsUIfDTjCQsTvERlHV7EEp9cg=";

  subPackages = [ "cmd/metrics-server" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X sigs.k8s.io/metrics-server/pkg/version.gitVersion=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Scalable and efficient source of container resource metrics";
    homepage = "https://github.com/kubernetes-sigs/metrics-server";
    license = licenses.asl20;
  };
}
