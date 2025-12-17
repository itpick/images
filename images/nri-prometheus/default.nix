{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-prometheus
# NRI (Node Resource Interface) plugin

let
  version = "2.27.4";
  nri-plugin = buildGoModule {
    pname = "nri-prometheus";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-prometheus";
      rev = "v${version}";
      hash = "sha256-MyNNNhVhcws7fHH9Gha4nD2QACUAsMfJljR9BFx551s=";
    };

    vendorHash = null;
    subPackages = [ "cmd/prometheus" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-prometheus";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/prometheus" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri prometheus";
    "org.opencontainers.image.description" = "NRI plugin nri-prometheus";
    "org.opencontainers.image.version" = version;
  };
}
