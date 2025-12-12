{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aquasecurity/trivy

buildGoModule rec {
  pname = "trivy";
  version = "0.68.1";

  src = fetchFromGitHub {
    owner = "aquasecurity";
    repo = "trivy";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/trivy" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/aquasecurity/trivy/pkg/version.ver=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more";
    homepage = "https://trivy.dev/";
    license = licenses.asl20;
  };
}
