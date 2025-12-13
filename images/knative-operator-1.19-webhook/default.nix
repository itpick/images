{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-operator-1.19-webhook
# Knative serverless component

let
  version = "1.17.0";
  knative-component = buildGoModule {
    pname = "knative-operator-1.19-webhook";
    inherit version;

    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-cLr2T9FGLGistXpMbo2Nyjw9soJ7DXcNFLw5BaAYiEc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/operator-1.19-webhook" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = knative-component;
  name = "knative-operator-1.19-webhook";
  tag = "v${version}";
  entrypoint = [ "${knative-component}/bin/operator-1.19-webhook" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "knative operator 1.19 weuhook";
    "org.opencontainers.image.description" = "Knative knative-operator-1.19-webhook component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
