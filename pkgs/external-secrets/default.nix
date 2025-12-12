{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/external-secrets/external-secrets

buildGoModule rec {
  pname = "external-secrets";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "external-secrets";
    repo = "external-secrets";
    rev = "v${version}";
    hash = "sha256-JF3HdYPTK+kERoG71Qh9gq3Sl0YqQWlGnMU97bIiTPo=";
  };

  vendorHash = null;

  subPackages = [ "." ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/external-secrets/external-secrets/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "External Secrets Operator reads from external APIs and injects values into Kubernetes Secrets";
    homepage = "https://external-secrets.io/";
    license = licenses.asl20;
  };
}
