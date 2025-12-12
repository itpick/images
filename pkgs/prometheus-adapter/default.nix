{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/prometheus-adapter

buildGoModule rec {
  pname = "prometheus-adapter";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "prometheus-adapter";
    rev = "v${version}";
    hash = "sha256-GNAfrDWVyl0SiIJ+cHYxaLGAwvsHpwhVp4ieGGleXWk=";
  };

  vendorHash = "sha256-K7IIzR2cHYbCABy8ehrCNS++fGyNdK0Z2sAR4qqtdxY=";

  subPackages = [ "cmd/adapter" ];

  env.CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" ];

  postInstall = ''
    mv $out/bin/adapter $out/bin/prometheus-adapter
  '';

  doCheck = false;

  meta = with lib; {
    description = "An implementation of the custom.metrics.k8s.io API using Prometheus";
    homepage = "https://github.com/kubernetes-sigs/prometheus-adapter";
    license = licenses.asl20;
  };
}
