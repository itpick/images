# k8s-dns-node-cache
# =============
# Kubernetes NodeLocalDNS - DNS caching agent for cluster nodes
# https://github.com/kubernetes/dns

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# NodeLocalDNS improves DNS performance by running a caching agent on nodes

let
  version = "1.22.27";
  k8s-dns-node-cache = buildGoModule {
    pname = "k8s-dns-node-cache";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "dns";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/node-cache" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X k8s.io/dns/pkg/version.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/node-cache $out/bin/node-cache-dns
    '';

    meta = with lib; {
      description = "Kubernetes NodeLocalDNS caching agent";
      homepage = "https://github.com/kubernetes/dns";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = k8s-dns-node-cache;
  name = "k8s-dns-node-cache";
  tag = version;
  entrypoint = [ "${k8s-dns-node-cache}/bin/node-cache-dns" ];
  cmd = [];

  extraPkgs = with pkgs; [
    dumb-init
    cacert
    iptables
  ];

  labels = {
    "org.opencontainers.image.title" = "K8s DNS Node Cache";
    "org.opencontainers.image.description" = "Kubernetes NodeLocalDNS caching agent";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "nodelocaldns";
  };
}