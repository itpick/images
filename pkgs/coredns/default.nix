{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/coredns/coredns

buildGoModule rec {
  pname = "coredns";
  version = "1.13.2";

  src = fetchFromGitHub {
    owner = "coredns";
    repo = "coredns";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/coredns/coredns/coremain.GitCommit=v${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "CoreDNS is a DNS server that chains plugins";
    homepage = "https://coredns.io/";
    license = licenses.asl20;
  };
}
