{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/dashboard

buildGoModule rec {
  pname = "kubernetes-dashboard";
  version = "7.14.0";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "dashboard";
    rev = "kubernetes-dashboard-${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "modules/api"
    "modules/auth"
    "modules/metrics-scraper"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X k8s.io/dashboard/api/pkg/environment.Version=${version}"
  ];

  postInstall = ''
    mv $out/bin/api $out/bin/dashboard-api
    mv $out/bin/auth $out/bin/dashboard-auth
  '';

  doCheck = false;

  meta = with lib; {
    description = "General-purpose web UI for Kubernetes clusters";
    homepage = "https://github.com/kubernetes/dashboard";
    license = licenses.asl20;
  };
}
