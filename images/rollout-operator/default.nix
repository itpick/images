{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "0.20.0";
  rollout-operator = buildGoModule {
    pname = "rollout-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "grafana";
      repo = "rollout-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes operator for managing rollouts";
      homepage = "https://github.com/grafana/rollout-operator";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = rollout-operator;
  name = "rollout-operator";
  tag = "v${version}";
  entrypoint = [ "${rollout-operator}/bin/rollout-operator" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Grafana Rollout Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for managing rollouts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "mimir-distributed";
  };
}
