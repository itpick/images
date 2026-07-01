{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/cert-manager/trust-manager

buildGoModule rec {
  pname = "trust-manager";
  version = "0.24.0";

  src = fetchFromGitHub {
    owner = "cert-manager";
    repo = "trust-manager";
    rev = "v${version}";
    hash = "sha256-4ek0g9zoMB0TDod5iSvEc5f/KPQk3FxVkduECTWvkds=";
  };

  vendorHash = "sha256-jxmBDTmj7hZcIbYiOdoSirngkoIm4pWeO2Qu4fB5SHY=";

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
