{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/projectcontour/contour

buildGoModule rec {
  pname = "contour";
  version = "1.33.0";

  src = fetchFromGitHub {
    owner = "projectcontour";
    repo = "contour";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd/contour" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/projectcontour/contour/internal/build.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Contour is a Kubernetes ingress controller using Envoy proxy";
    homepage = "https://projectcontour.io/";
    license = licenses.asl20;
  };
}
