{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aws/amazon-vpc-cni-k8s

buildGoModule rec {
  pname = "amazon-vpc-cni-k8s";
  version = "1.20.5";

  src = fetchFromGitHub {
    owner = "aws";
    repo = "amazon-vpc-cni-k8s";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/aws-k8s-agent"
    "cmd/aws-vpc-cni"
    "cmd/aws-vpc-cni-init"
    "cmd/cni-metrics-helper"
    "cmd/egress-cni-plugin"
    "cmd/routed-eni-cni-plugin"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X pkg/version.GitVersion=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Networking plugin for pod networking in Kubernetes using ENIs on AWS";
    homepage = "https://github.com/aws/amazon-vpc-cni-k8s";
    license = licenses.asl20;
  };
}
