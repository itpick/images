{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/spiffe/spire

buildGoModule rec {
  pname = "spire";
  version = "1.15.1";

  src = fetchFromGitHub {
    owner = "spiffe";
    repo = "spire";
    rev = "v${version}";
    hash = "sha256-7SmHj/st2r3ks8Bh6gVRlKoay5mHqpovH25qMxG9s40=";
  };

  proxyVendor = true;
  vendorHash = "sha256-wKVBqjid/PQi5JBB37c3h68Q8kUqbyaiDbLssO7Yo7A=";

  subPackages = [
    "cmd/spire-server"
    "cmd/spire-agent"
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
