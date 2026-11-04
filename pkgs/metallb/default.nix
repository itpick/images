{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/metallb/metallb

buildGoModule rec {
  pname = "metallb";
  version = "0.16.2";

  src = fetchFromGitHub {
    owner = "metallb";
    repo = "metallb";
    rev = "v${version}";
    hash = "sha256-qpBKtz6i4hrEwWcDeUyui7DT/nlHoBOxxTrM3BDOIFU=";
  };

  vendorHash = "sha256-7DHURGK702xBQEEKhuwxaXdH2MXCA/SvDsvXu7LNcIA=";

  subPackages = [
    "controller"
    "speaker"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X go.universe.tf/metallb/internal/version.version=${version}"
    "-X go.universe.tf/metallb/internal/version.gitBranch=main"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A network load-balancer implementation for Kubernetes using standard routing protocols";
    homepage = "https://metallb.universe.tf/";
    license = licenses.asl20;
  };
}
