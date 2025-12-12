{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-eventing-1.19-filter
# Knative serverless component

let
  version = "1.17.0";
  knative-component = buildGoModule {
    pname = "knative-eventing-1.19-filter";
    inherit version;

    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/eventing-1.19-filter" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = knative-component;
  name = "knative-eventing-1.19-filter";
  tag = "v${version}";
  entrypoint = [ "${knative-component}/bin/eventing-1.19-filter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "knative eventing 1.19 filter";
    "org.opencontainers.image.description" = "Knative knative-eventing-1.19-filter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
