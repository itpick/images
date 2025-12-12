{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/fluxcd/flux2

buildGoModule rec {
  pname = "flux";
  version = "2.7.5";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "flux2";
    rev = "v${version}";
    hash = "sha256-vTb1YE73xxCC4GlR6UW5Ibu+ck+N+KKYUg50csb7eUA=";
  };

  vendorHash = "sha256-AgWDvlXVZXXprWCeoNeAMDb6LeYfa9yG5afc7TNISQs=";

  subPackages = [ "cmd/flux" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.VERSION=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Open and extensible continuous delivery solution for Kubernetes";
    homepage = "https://fluxcd.io/";
    license = licenses.asl20;
  };
}
