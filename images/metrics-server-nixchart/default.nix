{ mkImage, pkgs, lib, ... }:

# Kubernetes Metrics Server - scalable, efficient source of container resource metrics
# https://github.com/kubernetes-sigs/metrics-server
# (iamguarded variant packages the upstream prebuilt binary)

let
  version = "0.8.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "metrics-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes-sigs/metrics-server/releases/download/v${version}/metrics-server-linux-amd64";
      hash = "sha256:0v19z9hlzhp3hyz1n5kzz4wnsnviiz6rnzszgsmhl41dj2jma96x";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/metrics-server
      runHook postInstall
    '';

    meta = with lib; {
      description = "Kubernetes Metrics Server";
      homepage = "https://github.com/kubernetes-sigs/metrics-server";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "metrics-server-nixchart";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/metrics-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "metrics-server-nixchart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
