{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/stakater/Reloader

buildGoModule rec {
  pname = "reloader";
  version = "1.4.19";

  src = fetchFromGitHub {
    owner = "stakater";
    repo = "Reloader";
    rev = "v${version}";
    hash = "sha256-j1K8l/1b25DhD74xJx5CcWUXYm0P/ny8FOID9ABSJSM=";
  };

  vendorHash = null;

  env.CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" ];

  doCheck = false;

  meta = with lib; {
    description = "Controller to watch changes in ConfigMap and Secrets to trigger rolling upgrade on Pods";
    homepage = "https://github.com/stakater/Reloader";
    license = licenses.asl20;
  };
}
