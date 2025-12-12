{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/cert-manager/trust-manager

buildGoModule rec {
  pname = "trust-manager";
  version = "0.20.3";

  src = fetchFromGitHub {
    owner = "cert-manager";
    repo = "trust-manager";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/trust-manager" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/cert-manager/trust-manager/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Distribute trust bundles across a Kubernetes cluster";
    homepage = "https://cert-manager.io/docs/projects/trust-manager/";
    license = licenses.asl20;
  };
}
