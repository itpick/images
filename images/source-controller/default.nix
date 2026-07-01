{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for source-controller:
# Packages NOT in nixpkgs:
#   flux-source-controller (1.7.4-r3)

let
  version = "1.9.1";
  source-controller = buildGoModule {
    pname = "source-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "source-controller";
      rev = "v${version}";
      hash = "sha256-Uir+Z0MuLvZLE38imAbAX6hV8AtohwFa1fafT+gN17Y=";
    };

    vendorHash = "sha256-KGTy/yoIrQ/ds53tF5A5Rhmxk1DkFK7Z8IBqlG8xtro=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux source-controller for fetching resources from external sources";
      homepage = "https://github.com/fluxcd/source-controller";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = source-controller;
  name = "source-controller";
  tag = "v${version}";
  entrypoint = [ "${source-controller}/bin/source-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Source Controller";
    "org.opencontainers.image.description" = "Fetches resources from external sources";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
