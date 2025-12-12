{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-helm
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-helm";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "helm";
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
  name = "rancher-helm";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/helm" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher helm";
    "org.opencontainers.image.description" = "Rancher rancher-helm";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
