{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for reloader:
# Packages NOT in nixpkgs:
#   kube-logging-operator-config-reloader (6.2.1-r1)

let
  version = "1.2.1";
  reloader = buildGoModule {
    pname = "reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "stakater";
      repo = "Reloader";
      rev = "v${version}";
      hash = "sha256-tRHHDw09PxjjKPoEDsyJw7ZNSvNb2xk7zYqJJe4d/MI=";
    };

    proxyVendor = true;
    vendorHash = "sha256-Ueu3rFpOpUUZWvu6TYwFU3sdJBxEzc4wuMFTOR24xfo=";

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes controller to watch changes in ConfigMap and Secrets";
      homepage = "https://github.com/stakater/Reloader";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = reloader;
  name = "reloader";
  tag = "v${version}";
  entrypoint = [ "${reloader}/bin/Reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Reloader";
    "org.opencontainers.image.description" = "Watches ConfigMaps and Secrets and triggers rolling upgrades";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reloader";
  };
}
