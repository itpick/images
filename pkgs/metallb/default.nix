{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/metallb/metallb

buildGoModule rec {
  pname = "metallb";
  version = "0.15.3";

  src = fetchFromGitHub {
    owner = "metallb";
    repo = "metallb";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "controller"
    "speaker"
    "frr-tools/reloader"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X go.universe.tf/metallb/internal/version.version=${version}"
    "-X go.universe.tf/metallb/internal/version.gitBranch=main"
  ];

  postInstall = ''
    mv $out/bin/reloader $out/bin/frr-reloader
  '';

  doCheck = false;

  meta = with lib; {
    description = "A network load-balancer implementation for Kubernetes using standard routing protocols";
    homepage = "https://metallb.universe.tf/";
    license = licenses.asl20;
  };
}
