{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aws/karpenter-provider-aws

buildGoModule rec {
  pname = "karpenter";
  version = "1.13.0";

  src = fetchFromGitHub {
    owner = "aws";
    repo = "karpenter-provider-aws";
    rev = "v${version}";
    hash = "sha256-SYJPFjXIUdtGt09gKkZrUsW6w2bypJOogZ6GvyqltRA=";
  };

  proxyVendor = true;
  vendorHash = "sha256-nXFKPNAFW7I28gAWgPH1t5nKQ3X6ITxQx8zba4hqFw0=";

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
