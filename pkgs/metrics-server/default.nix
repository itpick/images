{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/metrics-server

buildGoModule rec {
  pname = "metrics-server";
  version = "metrics-server-helm-chart-3.14.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "metrics-server";
    rev = "v${version}";
    hash = "sha256-1yzX1GkuCA321Z+v4XQqzO6Leuy5DhUUU0l8wlYJ16Y=";
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
