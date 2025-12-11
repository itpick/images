# eck-operator
# =============
# Elastic Cloud on Kubernetes (ECK) Operator
# Automates deployment of Elasticsearch, Kibana, APM Server on Kubernetes
# https://github.com/elastic/cloud-on-k8s

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for eck-operator:
# Packages NOT in nixpkgs - must build from source

let
  version = "3.2.0";
  eck-operator = buildGoModule {
    pname = "eck-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "elastic";
      repo = "cloud-on-k8s";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/elastic/cloud-on-k8s/v2/pkg/about.version=${version}"
      "-X github.com/elastic/cloud-on-k8s/v2/pkg/about.buildHash=nix"
      "-X github.com/elastic/cloud-on-k8s/v2/pkg/about.buildDate=1970-01-01T00:00:00Z"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/cmd $out/bin/elastic-operator
    '';

    meta = with lib; {
      description = "Elastic Cloud on Kubernetes Operator";
      homepage = "https://github.com/elastic/cloud-on-k8s";
      license = licenses.elastic20;
    };
  };

in
mkImage {
  drv = eck-operator;
  name = "eck-operator";
  tag = "v${version}";
  entrypoint = [ "${eck-operator}/bin/elastic-operator" ];
  cmd = [ "manager" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "ECK Operator";
    "org.opencontainers.image.description" = "Elastic Cloud on Kubernetes Operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "eck-operator";
  };
}
