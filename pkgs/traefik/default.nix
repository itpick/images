{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/traefik/traefik

buildGoModule rec {
  pname = "traefik";
  version = "3.6.4";

  src = fetchFromGitHub {
    owner = "traefik";
    repo = "traefik";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/traefik" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/traefik/traefik/v3/pkg/version.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "The Cloud Native Application Proxy";
    homepage = "https://traefik.io/";
    license = licenses.mit;
  };
}
