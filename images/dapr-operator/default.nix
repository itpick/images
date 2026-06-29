{ mkImage, pkgs, lib, ... }:

# Dapr operator - control plane component of the Dapr distributed runtime
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dapr-operator";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/operator_linux_amd64.tar.gz";
      hash = "sha256-7F8MOIowvGPoRmEcrZ6y7PTqe4jMgP3QaAoe2ZrElRM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 operator $out/bin/operator
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr operator control plane component";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "dapr-operator";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/operator" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
