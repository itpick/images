{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-ui
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-ui";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "ui";
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
  name = "rancher-ui";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/ui" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher ui";
    "org.opencontainers.image.description" = "Rancher rancher-ui";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
