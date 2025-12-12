{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aquasecurity/trivy

buildGoModule rec {
  pname = "trivy";
  version = "0.68.1";

  src = fetchFromGitHub {
    owner = "aquasecurity";
    repo = "trivy";
    rev = "v${version}";
    hash = "sha256-EW8M5qEQlNohftMBaUs21/dr06/uKanXiDSduOJhplo=";
  };

  vendorHash = "sha256-IB3DbK6aHimYRMH+oBnY1AfGsMEDrR1jEr1uNAbhz50=";

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
