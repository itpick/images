{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/dexidp/dex

buildGoModule rec {
  pname = "dex";
  version = "2.44.0";

  src = fetchFromGitHub {
    owner = "dexidp";
    repo = "dex";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

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
