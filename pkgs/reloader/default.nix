{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/stakater/Reloader

buildGoModule rec {
  pname = "reloader";
  version = "1.4.11";

  src = fetchFromGitHub {
    owner = "stakater";
    repo = "Reloader";
    rev = "v${version}";
    hash = "sha256-ca+D1z5fPdc8g8/koly//uKWK4u2lxMmmjsq+Llz/wg=";
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
