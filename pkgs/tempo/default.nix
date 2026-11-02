{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/grafana/tempo

buildGoModule rec {
  pname = "tempo";
  version = "3.1.1";

  src = fetchFromGitHub {
    owner = "grafana";
    repo = "tempo";
    rev = "v${version}";
    hash = "sha256-BUfkRfdt409G8mF5k1oGrfyX61LQL4ngQ2vT7znFcWI=";
  };

  vendorHash = null;

  subPackages = [
    "cmd/tempo"
    "cmd/tempo-query"
    "cmd/tempo-cli"
    "cmd/tempo-vulture"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.Version=${version}"
    "-X main.Branch=main"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Grafana Tempo is a high volume, minimal dependency distributed tracing backend";
    homepage = "https://grafana.com/oss/tempo/";
    license = licenses.agpl3Only;
  };
}
