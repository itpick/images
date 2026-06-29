{ mkImage, pkgs, lib, ... }:

# regsync — upstream prebuilt release binary
let
  version = "0.11.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "regsync";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/regclient/regclient/releases/download/v0.11.5/regsync-linux-amd64";
      hash = "sha256-SG1fysB24xg3hkYyRG3iJRnYgQHbSktM+qTuM1DkFgY=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/regsync
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "regclient-regsync";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/regsync" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "regclient-regsync";
    "org.opencontainers.image.description" = "regclient regsync - registry mirror tool";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
