{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/stakater/Reloader

buildGoModule rec {
  pname = "reloader";
  version = "1.4.23";

  src = fetchFromGitHub {
    owner = "stakater";
    repo = "Reloader";
    rev = "v${version}";
    hash = "sha256-yxQrfWWLZA83ftR/Pinh0QXC/1zRU2+slmFD1gVoMtU=";
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
