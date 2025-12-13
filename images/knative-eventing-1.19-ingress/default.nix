{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-eventing-1.19-ingress
# Knative serverless component

let
  version = "1.17.0";
  knative-component = buildGoModule {
    pname = "knative-eventing-1.19-ingress";
    inherit version;

    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-cLr2T9FGLGistXpMbo2Nyjw9soJ7DXcNFLw5BaAYiEc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/eventing-1.19-ingress" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = knative-component;
  name = "knative-eventing-1.19-ingress";
  tag = "v${version}";
  entrypoint = [ "${knative-component}/bin/eventing-1.19-ingress" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "knative eventing 1.19 ingress";
    "org.opencontainers.image.description" = "Knative knative-eventing-1.19-ingress component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
