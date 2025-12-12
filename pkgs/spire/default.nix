{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/spiffe/spire

buildGoModule rec {
  pname = "spire";
  version = "1.14.0";

  src = fetchFromGitHub {
    owner = "spiffe";
    repo = "spire";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [
    "cmd/spire-server"
    "cmd/spire-agent"
    "cmd/oidc-discovery-provider"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/spiffe/spire/pkg/common/version.gittag=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "The SPIFFE Runtime Environment";
    homepage = "https://spiffe.io/";
    license = licenses.asl20;
  };
}
