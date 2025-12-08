{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "0.14.0";
  configmap-reload = buildGoModule {
    pname = "configmap-reload";
    inherit version;

    src = fetchFromGitHub {
      owner = "jimmidyson";
      repo = "configmap-reload";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];

    doCheck = false;

    meta = with lib; {
      description = "Watches ConfigMaps and triggers reloads on changes";
      homepage = "https://github.com/jimmidyson/configmap-reload";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = configmap-reload;
  name = "configmap-reload";
  tag = "v${version}";
  entrypoint = [ "${configmap-reload}/bin/configmap-reload" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "ConfigMap Reload";
    "org.opencontainers.image.description" = "Watches ConfigMaps and triggers reloads";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
