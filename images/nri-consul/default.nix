{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-consul
# NRI (Node Resource Interface) plugin

let
  version = "2.9.5";
  nri-plugin = buildGoModule {
    pname = "nri-consul";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-consul";
      rev = "v${version}";
      hash = "sha256-TOV8T5TxKHL8/1BnrO/ipYTruZJnuvJYKDzYkJ8cvic=";
    };

    vendorHash = null;
    subPackages = [ "cmd/consul" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-consul";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/consul" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri consul";
    "org.opencontainers.image.description" = "NRI plugin nri-consul";
    "org.opencontainers.image.version" = version;
  };
}
