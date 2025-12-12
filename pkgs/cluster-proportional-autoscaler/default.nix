{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/cluster-proportional-autoscaler

buildGoModule rec {
  pname = "cluster-proportional-autoscaler";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "cluster-proportional-autoscaler";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X k8s.io/component-base/version.gitVersion=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Container autoscaler based on cluster size";
    homepage = "https://github.com/kubernetes-sigs/cluster-proportional-autoscaler";
    license = licenses.asl20;
  };
}
