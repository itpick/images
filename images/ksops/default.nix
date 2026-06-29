{ mkImage, pkgs, lib, ... }:

# KSOPS - kustomize SOPS plugin
# https://github.com/viaduct-ai/kustomize-sops

let
  version = "4.5.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "ksops";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/viaduct-ai/kustomize-sops/releases/download/v${version}/ksops_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-lkHgOjAb8vxLmNDoN6A1HhykQ+zXposl5q8hSfuy7zA=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 ksops $out/bin/ksops
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "ksops";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/ksops" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "ksops";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
