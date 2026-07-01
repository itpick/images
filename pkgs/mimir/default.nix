{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/grafana/mimir

buildGoModule rec {
  pname = "mimir";
  version = "3.1.2";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "mimir";
    rev = "mimir-${version}";
    hash = "sha256-8GvpmCanVlsObH1mwPA/TsHzNp3f0hzF7fURIDHy/DU=";
  };

  vendorHash = null;

  subPackages = [
    "cmd/mimir"
    "cmd/mimirtool"
    "cmd/metaconvert"
    "cmd/query-tee"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/grafana/mimir/pkg/util/version.Version=${version}"
    "-X github.com/grafana/mimir/pkg/util/version.Branch=main"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Grafana Mimir provides horizontally scalable, highly available, multi-tenant, long-term storage for Prometheus";
    homepage = "https://grafana.com/oss/mimir/";
    license = licenses.agpl3Only;
  };
}
