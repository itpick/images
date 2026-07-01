{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/metrics-server

buildGoModule rec {
  pname = "metrics-server";
  version = "0.8.1";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "metrics-server";
    rev = "v${version}";
    hash = "sha256-ERrHDcacsPAL/44Ff3EWMaTvSv2c3o61uJeod1nduKc=";
  };

  vendorHash = "sha256-nAzmVQqKV8QrCajWV2o6mmDoTrHXKbWaDxXheTJRko0=";

  subPackages = [ "cmd/metrics-server" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X sigs.k8s.io/metrics-server/pkg/version.gitVersion=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Scalable and efficient source of container resource metrics";
    homepage = "https://github.com/kubernetes-sigs/metrics-server";
    license = licenses.asl20;
  };
}
