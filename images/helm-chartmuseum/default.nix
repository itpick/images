{ mkImage, pkgs, lib, ... }:

# ChartMuseum - an open-source Helm Chart Repository server
# https://github.com/helm/chartmuseum

let
  version = "0.16.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "chartmuseum";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://get.helm.sh/chartmuseum-v${version}-linux-amd64.tar.gz";
      hash = "sha256-aH1qDa83K+6L1Titd9adAHgl/H6rit6LguQB+Exuwa4=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 chartmuseum $out/bin/chartmuseum
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
  inherit drv;
  name = "helm-chartmuseum";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/chartmuseum" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "helm-chartmuseum";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
