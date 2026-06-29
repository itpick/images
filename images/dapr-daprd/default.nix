{ mkImage, pkgs, lib, ... }:

# Dapr sidecar runtime (daprd)
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  daprd = pkgs.stdenv.mkDerivation rec {
    pname = "daprd";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/daprd_linux_amd64.tar.gz";
      hash = "sha256-0CPAClp6etwX1D/PSiOJtvK6HZw0Z+lEVrdLIo6ajFA=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 daprd $out/bin/daprd
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr sidecar runtime";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = daprd;
  name = "dapr-daprd";
  tag = "v${version}";
  entrypoint = [ "${daprd}/bin/daprd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dapr-daprd";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
