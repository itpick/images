{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aws/karpenter-provider-aws

buildGoModule rec {
  pname = "karpenter";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "aws";
    repo = "karpenter-provider-aws";
    rev = "v${version}";
    hash = "sha256-0CoVojZwmySfP587LE2zfrtXKXtCHDGxo6bj22i8RsE=";
  };

  vendorHash = null;

  subPackages = [ "cmd/controller" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/aws/karpenter-provider-aws/pkg/utils/version.Version=${version}"
  ];

  postInstall = ''
    mv $out/bin/controller $out/bin/karpenter
  '';

  doCheck = false;

  meta = with lib; {
    description = "Karpenter is a Kubernetes Node Autoscaler built for flexibility, performance, and simplicity";
    homepage = "https://karpenter.sh/";
    license = licenses.asl20;
  };
}
