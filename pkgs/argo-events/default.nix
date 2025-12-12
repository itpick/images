{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/argoproj/argo-events

buildGoModule rec {
  pname = "argo-events";
  version = "1.9.9";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-events";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/controller"
    "cmd/eventsource-controller"
    "cmd/sensor-controller"
    "cmd/eventbus-controller"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj/argo-events.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Event-driven workflow automation framework for Kubernetes";
    homepage = "https://argoproj.github.io/argo-events/";
    license = licenses.asl20;
  };
}
