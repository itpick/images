{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-kubernetes
# NRI (Node Resource Interface) plugin

let
  version = "3.51.1";
  nri-plugin = buildGoModule {
    pname = "nri-kubernetes";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-kubernetes";
      rev = "v${version}";
      hash = "sha256-5eInOp36Te266UiCfGTIk8qVZodZt3J0N/Xs+leiUzY=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kubernetes" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-kubernetes";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/kubernetes" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri kuuernetes";
    "org.opencontainers.image.description" = "NRI plugin nri-kubernetes";
    "org.opencontainers.image.version" = version;
  };
}
