{ mkImage, pkgs, lib, ... }:

# LiveKit - open source WebRTC SFU server
# https://github.com/livekit/livekit

let
  version = "1.13.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "livekit-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/livekit/livekit/releases/download/v${version}/livekit_${version}_linux_amd64.tar.gz";
      hash = "sha256:029xw7wxah8j9a782brvdwkr2ng5xipjscmfyam8qdaaz1jv9641";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 livekit-server $out/bin/livekit-server
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "livekit-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/livekit-server" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the SFU:
  # --dev starts with built-in placeholder API keys (devkey/secret) so the bare
  # image needs no config or mounted secret, and --bind 0.0.0.0 makes the HTTP/
  # WebSocket signal server (:7880) + RTC TCP (:7881) reachable by the kind-test
  # probe. (Verified: the server stays up and listens on 0.0.0.0:7880/7881.)
  # Operators run production with their own --config / LIVEKIT_CONFIG (real API
  # keys, Redis, TURN) instead of --dev.
  cmd = [ "--dev" "--bind" "0.0.0.0" ];
  labels = {
    "org.opencontainers.image.title" = "livekit-server";
    "org.opencontainers.image.description" = "LiveKit open source WebRTC SFU server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
