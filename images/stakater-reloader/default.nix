{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

# stakater/Reloader — Kubernetes controller for rolling upgrades on ConfigMap/Secret changes.
# https://github.com/stakater/Reloader

let
  version = "1.4.14";
  reloader = buildGoModule {
    pname = "reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "stakater";
      repo = "Reloader";
      rev = "v${version}";
      hash = "sha256-4d2BwcIn8Hppc0I+mezKbuqQZ/o0dYKJH8ik985zgHk=";
    };

    proxyVendor = true;
    vendorHash = "sha256-BgbaUceVvsYFUcGO6TFwQtKOLJslrflWiewwZs1v68c=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes controller to watch changes in ConfigMap and Secrets and trigger rolling upgrades";
      homepage = "https://github.com/stakater/Reloader";
      license = licenses.asl20;
    };
  };
in

mkImage {
  drv = reloader;
  name = "stakater-reloader";
  tag = "v${version}";
  entrypoint = [ "${reloader}/bin/Reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Stakater Reloader";
    "org.opencontainers.image.description" = "Kubernetes controller to watch ConfigMaps and Secrets and trigger rolling upgrades";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reloader";
  };
}
