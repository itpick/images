{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/fluxcd/flux2

buildGoModule rec {
  pname = "flux";
  version = "2.7.5";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/flux" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.VERSION=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Open and extensible continuous delivery solution for Kubernetes";
    homepage = "https://fluxcd.io/";
    license = licenses.asl20;
  };
}
