{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kubernetes-sigs/node-feature-discovery

buildGoModule rec {
  pname = "node-feature-discovery";
  version = "0.18.3";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "node-feature-discovery";
    rev = "v${version}";
    hash = "sha256-3nDkhZYiG8ZYP0vnK+Xs6Fl3N93RRuuZYlTjRup6BQk=";
  };

  vendorHash = "sha256-sA9OukYpNEe0tDD/WTGFbWMvMKtk8F8oakFNAEwGG6M=";

  subPackages = [
    "cmd/nfd-master"
    "cmd/nfd-worker"
    "cmd/nfd-gc"
    "cmd/nfd-topology-updater"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X sigs.k8s.io/node-feature-discovery/pkg/version.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Node feature discovery for Kubernetes";
    homepage = "https://github.com/kubernetes-sigs/node-feature-discovery";
    license = licenses.asl20;
  };
}
