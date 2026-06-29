{ mkImage, pkgs, lib, ... }:

# Cerbos - stateless authorization layer / policy decision point
# https://github.com/cerbos/cerbos
let
  version = "0.53.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cerbos";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cerbos/cerbos/releases/download/v${version}/cerbos_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-VkJxdr0uXmdgl/mgh0PtIR58ASOvHnGkj5TUl+PJ4TE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 cerbos $out/bin/cerbos
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cerbos-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cerbos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cerbos-fips";
    "org.opencontainers.image.description" = "Cerbos authorization layer";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
