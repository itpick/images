{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-kafka
# NRI (Node Resource Interface) plugin

let
  version = "3.15.2";
  nri-plugin = buildGoModule {
    pname = "nri-kafka";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-kafka";
      rev = "v${version}";
      hash = "sha256-QQ09DOpKpn6l6AjrDuGpQB4UGfYbREwd2+XaDHZ2/f8=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kafka" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-kafka";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/kafka" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri kafka";
    "org.opencontainers.image.description" = "NRI plugin nri-kafka";
    "org.opencontainers.image.version" = version;
  };
}
