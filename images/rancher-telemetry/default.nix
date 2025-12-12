{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-telemetry
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-telemetry";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "telemetry";
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
  name = "rancher-telemetry";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/telemetry" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher telemetry";
    "org.opencontainers.image.description" = "Rancher rancher-telemetry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
