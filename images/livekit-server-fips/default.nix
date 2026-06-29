{ mkImage, pkgs, lib, ... }:

# LiveKit - open source WebRTC SFU server (fips variant of the same upstream binary)
# https://github.com/livekit/livekit

let
  version = "1.13.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "livekit-server-fips";
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
  name = "livekit-server-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/livekit-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "livekit-server-fips";
    "org.opencontainers.image.description" = "LiveKit open source WebRTC SFU server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
