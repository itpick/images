{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/grafana/loki

buildGoModule rec {
  pname = "loki";
  version = "helm-loki-7.0.0";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "loki";
    rev = "v${version}";
    hash = "sha256-2dqwnM2+9+P/ZIiz5Z9JPN9WicHLRzq9xn6jG1OBqLs=";
  };

  vendorHash = null;

  subPackages = [
    "cmd/loki"
    "cmd/logcli"
    "clients/cmd/promtail"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/grafana/loki/v3/pkg/util/build.Version=${version}"
    "-X github.com/grafana/loki/v3/pkg/util/build.Branch=main"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Like Prometheus, but for logs";
    homepage = "https://grafana.com/oss/loki/";
    license = licenses.agpl3Only;
  };
}
