# Cilium Certgen - Certificate generator for Hubble and Cilium
# https://github.com/cilium/certgen

{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "cilium-certgen";
  version = "0.4.6";

  src = fetchFromGitHub {
    owner = "cilium";
    repo = "certgen";
    rev = "v${version}";
    hash = "sha256-moe5aArCHQ71P7AjIV61hatP7rOHOl9dNjzPpH3wUGE=";
  };

  vendorHash = null;  # Uses vendored dependencies
  env.CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/cilium/certgen/internal/version.Version=${version}"
  ];

  meta = with lib; {
    description = "Certificate generator for Hubble and Cilium";
    homepage = "https://github.com/cilium/certgen";
    license = licenses.asl20;
    mainProgram = "certgen";
  };
}
