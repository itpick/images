{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/dexidp/dex

buildGoModule rec {
  pname = "dex";
  version = "2.45.1";

  src = fetchFromGitHub {
    owner = "dexidp";
    repo = "dex";
    rev = "v${version}";
    hash = "sha256-A6PHuo3cr9m7/u/o8agOL+BiKdOKuLDvlS62O7zt/Jk=";
  };

  vendorHash = "sha256-1D20aZhNUi7MUPfRTmSV4CZjLr0lUzbX4TI2LFcPY3U=";

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
