{ mkImage, pkgs, lib, ... }:

# regbot — upstream prebuilt release binary
let
  version = "0.11.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "regbot";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/regclient/regclient/releases/download/v0.11.5/regbot-linux-amd64";
      hash = "sha256-ax9XzT7rUa8mB7I/ROJvG2vw5bS23qDTZIBKu5PLwRI=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/regbot
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "regclient-regbot-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/regbot" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "regclient-regbot-fips";
    "org.opencontainers.image.description" = "regclient regbot - registry automation tool";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
