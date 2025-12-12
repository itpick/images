{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-webhook
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-webhook";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "webhook";
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
  name = "rancher-webhook";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/webhook" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher weuhook";
    "org.opencontainers.image.description" = "Rancher rancher-webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
