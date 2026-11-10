{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes/kube-state-metrics

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };
in
buildGoModule (rec {
  pname = "kube-state-metrics";
  version = "2.20.0";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "kube-state-metrics";
    rev = "v${version}";
    hash = "sha256-tgPbb7N/ZrIJqJF50kpJ5VOADSHnJ7dprxvL+J81Tjk=";
  };

  vendorHash = "sha256-GWg7Y/Oju5qP52Tne2xQmOg5fvGEpkcSSxVjztEWeJA=";

  subPackages = [ "." ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/prometheus/common/version.Version=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Generate metrics from Kubernetes API objects";
    homepage = "https://github.com/kubernetes/kube-state-metrics";
    license = licenses.asl20;
  };
} // goModBump [
  "golang.org/x/net@v0.62.0"
  "google.golang.org/grpc@v1.83.2"
])
