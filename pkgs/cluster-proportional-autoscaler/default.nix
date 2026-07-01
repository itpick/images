{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/cluster-proportional-autoscaler

buildGoModule rec {
  pname = "cluster-proportional-autoscaler";
  version = "1.10.3";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "cluster-proportional-autoscaler";
    rev = "v${version}";
    hash = "sha256-qL3dzsfTO26OURdezIg7MxLXKy8fjQ+3jNpGHKtZLno=";
  };

  vendorHash = null;

  subPackages = [ "cmd/cluster-proportional-autoscaler" ];

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
