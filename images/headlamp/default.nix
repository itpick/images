# headlamp
# =============
# Headlamp - Kubernetes web UI dashboard
# https://github.com/kubernetes-sigs/headlamp

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Headlamp is an easy-to-use and extensible Kubernetes web UI

let
  version = "0.37.0";
  headlamp-server = buildGoModule {
    pname = "headlamp-server";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "headlamp";
      rev = "v${version}";
      hash = "sha256-n6yzHTayWyjbpUWnVgACQ7jkdTMoNGjKJrrFW/5HWE8=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    sourceRoot = "source/backend";

    subPackages = [ "cmd/server" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/server $out/bin/headlamp-server
    '';

    meta = with lib; {
      description = "Headlamp - Kubernetes web UI dashboard";
      homepage = "https://github.com/kubernetes-sigs/headlamp";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = headlamp-server;
  name = "headlamp";
  tag = "v${version}";
  entrypoint = [ "${headlamp-server}/bin/headlamp-server" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    nodejs  # For frontend serving
  ];

  env = {
    HEADLAMP_CONFIG_HOME = "/headlamp";
  };

  labels = {
    "org.opencontainers.image.title" = "Headlamp";
    "org.opencontainers.image.description" = "Headlamp - Kubernetes web UI dashboard";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "headlamp";
  };
}