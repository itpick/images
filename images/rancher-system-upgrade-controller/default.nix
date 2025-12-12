{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-system-upgrade-controller
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-system-upgrade-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "system-upgrade-controller";
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
  name = "rancher-system-upgrade-controller";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/system-upgrade-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher system upgrade controller";
    "org.opencontainers.image.description" = "Rancher rancher-system-upgrade-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
