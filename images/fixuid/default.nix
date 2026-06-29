{ mkImage, pkgs, lib, ... }:

# fixuid - reconcile container user/group ownership at runtime
# https://github.com/boxboat/fixuid

let
  version = "0.6.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "fixuid";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/boxboat/fixuid/releases/download/v${version}/fixuid-${version}-linux-amd64.tar.gz";
      hash = "sha256:057sqmw0nld9dmvcxnnyzkvikngajx0fm5hphxwhxipfqi7gciwc";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 fixuid $out/bin/fixuid
      runHook postInstall
    '';

    meta = with lib; {
      description = "Reconcile container user/group ownership at runtime";
      homepage = "https://github.com/boxboat/fixuid";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "fixuid";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/fixuid" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fixuid";
    "org.opencontainers.image.description" = "Reconcile container user/group ownership at runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
