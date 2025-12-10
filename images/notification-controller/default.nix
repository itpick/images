{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for notification-controller:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   flux-notification-controller (1.7.5-r3)
#   ld-linux (2.42-r4)

let
  version = "1.7.5";
  notification-controller = buildGoModule {
    pname = "notification-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "notification-controller";
      rev = "v${version}";
      hash = "sha256-IQuhu6p9NBfa4lGJA2eAKNYjqf/ioeNasKezoB4ZOn4=";
    };

    vendorHash = "sha256-+xsR9hNBa3APAeVV2SjEvHnCmXbzJPh3V7dP23cHCSo=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux notification-controller for event handling and alerting";
      homepage = "https://github.com/fluxcd/notification-controller";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = notification-controller;
  name = "notification-controller";
  tag = "v${version}";
  entrypoint = [ "${notification-controller}/bin/notification-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Notification Controller";
    "org.opencontainers.image.description" = "Handles events and sends alerts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
