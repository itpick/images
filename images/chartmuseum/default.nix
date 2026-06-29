{ mkImage, pkgs, lib, ... }:

# ChartMuseum - Helm Chart Repository server
# https://github.com/helm/chartmuseum

let
  version = "0.16.5";

  chartmuseum = pkgs.stdenv.mkDerivation rec {
    pname = "chartmuseum";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://get.helm.sh/chartmuseum-v${version}-linux-amd64.tar.gz";
      hash = "sha256-aH1qDa83K+6L1Titd9adAHgl/H6rit6LguQB+Exuwa4=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp linux-amd64/chartmuseum $out/bin/chartmuseum
      chmod +x $out/bin/chartmuseum
      runHook postInstall
    '';

    meta = with lib; {
      description = "Helm Chart Repository server";
      homepage = "https://github.com/helm/chartmuseum";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = chartmuseum;
  name = "chartmuseum";
  tag = "v${version}";
  entrypoint = [ "${chartmuseum}/bin/chartmuseum" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "chartmuseum";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
