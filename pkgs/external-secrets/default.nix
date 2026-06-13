{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/external-secrets/external-secrets

buildGoModule rec {
  pname = "external-secrets";
  version = "2.4.1";

  src = fetchFromGitHub {
    owner = "external-secrets";
    repo = "external-secrets";
    rev = "v${version}";
    hash = "sha256-WTG32cdZxBgZT5wOjjKn/ahOUDlIOecLX206R2b07xM=";
  };

  vendorHash = "sha256-6Gdii+/UhOkaWwJRNZEtKXXDmodcBz1l8wjawAEToKY=";

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
