{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-fleet-agent
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-fleet-agent";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "fleet-agent";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = rancher-component;
  name = "rancher-fleet-agent";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/fleet-agent" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher fleet agent";
    "org.opencontainers.image.description" = "Rancher rancher-fleet-agent";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
