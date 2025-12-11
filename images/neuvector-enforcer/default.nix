# neuvector-enforcer
# =============
# NeuVector Enforcer - Container security enforcement agent
# https://github.com/neuvector/neuvector
#
# NeuVector Enforcer runs on each node to enforce security policies
# and monitor container activity.

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

let
  version = "5.4.7";
  neuvector-enforcer = buildGoModule {
    pname = "neuvector-enforcer";
    inherit version;

    src = fetchFromGitHub {
      owner = "neuvector";
      repo = "neuvector";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "agent" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/agent $out/bin/enforcer
    '';

    meta = with lib; {
      description = "NeuVector Enforcer - Container security agent";
      homepage = "https://github.com/neuvector/neuvector";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = neuvector-enforcer;
  name = "neuvector-enforcer";
  tag = "v${version}";
  entrypoint = [ "${neuvector-enforcer}/bin/enforcer" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    busybox
    cacert
    consul
    curl
    ethtool
    iproute2
    iptables
    jq
    libpcap
    procps
  ];

  labels = {
    "org.opencontainers.image.title" = "NeuVector Enforcer";
    "org.opencontainers.image.description" = "Container security enforcement agent";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "neuvector";
  };
}
