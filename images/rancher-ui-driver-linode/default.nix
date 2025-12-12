{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-ui-driver-linode
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-ui-driver-linode";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "ui-driver-linode";
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
  name = "rancher-ui-driver-linode";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/ui-driver-linode" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher ui driver linode";
    "org.opencontainers.image.description" = "Rancher rancher-ui-driver-linode";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
