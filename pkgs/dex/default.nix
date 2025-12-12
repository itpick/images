{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/dexidp/dex

buildGoModule rec {
  pname = "dex";
  version = "2.44.0";

  src = fetchFromGitHub {
    owner = "dexidp";
    repo = "dex";
    rev = "v${version}";
    hash = "sha256-wpy7pZBpqAaPjWbnsqtnE+65a58IGg0pyp4CEUnmmc4=";
  };

  vendorHash = "sha256-3ef2G4+UlLGsBW09ZM20qU82uj/hVlMAnujcd2BulGg=";

  subPackages = [ "cmd/dex" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "OpenID Connect (OIDC) identity and OAuth 2.0 provider";
    homepage = "https://dexidp.io/";
    license = licenses.asl20;
  };
}
