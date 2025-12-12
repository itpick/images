{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/linkerd/linkerd2

buildGoModule rec {
  pname = "linkerd";
  version = "2.14.10";

  src = fetchFromGitHub {
    owner = "linkerd";
    repo = "linkerd2";
    rev = "stable-${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "controller/cmd/destination"
    "controller/cmd/heartbeat"
    "controller/cmd/identity"
    "controller/cmd/proxy-injector"
    "controller/cmd/sp-validator"
    "cli"
    "policy-controller"
    "viz/cmd/tap"
    "viz/cmd/metrics-api"
    "viz/cmd/web"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/linkerd/linkerd2/pkg/version.Version=stable-${version}"
  ];

  postInstall = ''
    mv $out/bin/cli $out/bin/linkerd
  '';

  doCheck = false;

  meta = with lib; {
    description = "Ultralight, security-first service mesh for Kubernetes";
    homepage = "https://linkerd.io/";
    license = licenses.asl20;
  };
}
