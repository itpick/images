{ mkImage, pkgs, lib, ... }:

# Cerbos - decoupled access control / authorization server
# https://github.com/cerbos/cerbos

let
  version = "0.53.0";

  cerbos = pkgs.stdenv.mkDerivation rec {
    pname = "cerbos";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cerbos/cerbos/releases/download/v${version}/cerbos_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-VkJxdr0uXmdgl/mgh0PtIR58ASOvHnGkj5TUl+PJ4TE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp cerbos $out/bin/cerbos
      chmod +x $out/bin/cerbos
      runHook postInstall
    '';

    meta = with lib; {
      description = "Decoupled access control / authorization server";
      homepage = "https://github.com/cerbos/cerbos";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = cerbos;
  name = "cerbos";
  tag = "v${version}";
  entrypoint = [ "${cerbos}/bin/cerbos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cerbos";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
