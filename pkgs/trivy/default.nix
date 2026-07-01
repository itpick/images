{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aquasecurity/trivy

buildGoModule rec {
  pname = "trivy";
  version = "0.72.0";

  src = fetchFromGitHub {
    owner = "aquasecurity";
    repo = "trivy";
    rev = "v${version}";
    hash = "sha256-BfYgHa5Qv5rwJSRLdaDeCU4pz1jrUG72QzsJ98F5Is8=";
  };

  vendorHash = "sha256-9dlCZRfjaD2vklJ+Mv16I/5FR9w80L73DR6v2MLQ0WQ=";

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
