{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/aws-load-balancer-controller

buildGoModule rec {
  pname = "aws-load-balancer-controller";
  version = "2.17.1";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "aws-load-balancer-controller";
    rev = "v${version}";
    hash = "sha256-7vMdJc+rGz9AqIHmhrvIvGs3S7Lx5eTWGEA2wOyA1I8=";
  };

  proxyVendor = true;
  vendorHash = "sha256-DiENKnLEXb6sNu9jorKOqbhA9kHV6TWAo8qiGqB2Ie0=";

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
