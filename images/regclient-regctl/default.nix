{ mkImage, pkgs, lib, ... }:

# regctl — upstream prebuilt release binary
let
  version = "0.11.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "regctl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/regclient/regclient/releases/download/v0.11.5/regctl-linux-amd64";
      hash = "sha256-yTqnY4dJ9aqsGo4BeHMhiJx48BAYCbsogDQ0eNC6BGc=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/regctl
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "regclient-regctl";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/regctl" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "regclient-regctl";
    "org.opencontainers.image.description" = "regclient regctl - registry client CLI";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
