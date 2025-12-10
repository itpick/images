{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for image-automation-controller:
# Packages NOT in nixpkgs:
#   flux-image-automation-controller (1.0.4-r3)

let
  version = "1.0.4";
  image-automation-controller = buildGoModule {
    pname = "image-automation-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-automation-controller";
      rev = "v${version}";
      hash = "sha256-G4/RXdLcZ5Cijf/x66bf/3ItzgieYGSHxkkCTMX5uwA=";
    };

    vendorHash = "sha256-rEUCojsek+784M1OyxCRP23usRwvYQRpLezjKD3/4AY=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux image-automation-controller for automated image updates";
      homepage = "https://github.com/fluxcd/image-automation-controller";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = image-automation-controller;
  name = "image-automation-controller";
  tag = "v${version}";
  entrypoint = [ "${image-automation-controller}/bin/image-automation-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Image Automation Controller";
    "org.opencontainers.image.description" = "Automates container image updates";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
