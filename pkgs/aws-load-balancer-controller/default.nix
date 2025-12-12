{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/aws-load-balancer-controller

buildGoModule rec {
  pname = "aws-load-balancer-controller";
  version = "2.16.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "aws-load-balancer-controller";
    rev = "v${version}";
    hash = "sha256-Aq2au9UPJgJIH7kDAydV20Od7hcZ1eMhMnyups8stR8=";
  };

  vendorHash = "sha256-40uVmv/kCfqKKM53jPJNcwmt6uLRul9hOyU81a1TmnM=";

  subPackages = [ "." ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X sigs.k8s.io/aws-load-balancer-controller/pkg/version.GitVersion=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A Kubernetes controller for Elastic Load Balancers";
    homepage = "https://github.com/kubernetes-sigs/aws-load-balancer-controller";
    license = licenses.asl20;
  };
}
