{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-discovery-kubernetes-fips
# NRI (Node Resource Interface) plugin

let
  version = "1.13.7";
  nri-plugin = buildGoModule {
    pname = "nri-discovery-kubernetes-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-discovery-kubernetes";
      rev = "v${version}";
      hash = "sha256-8DiJMBJV/DIvwSwFIpuUXeV+MlL1L4r6Zu7hMiCTmok=";
    };

    vendorHash = null;
    subPackages = [ "cmd/discovery-kubernetes" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-discovery-kubernetes-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/discovery-kubernetes" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri discovery kuuernetes";
    "org.opencontainers.image.description" = "NRI plugin nri-discovery-kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
