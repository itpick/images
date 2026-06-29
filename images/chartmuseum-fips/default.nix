{ mkImage, pkgs, lib, ... }:

# ChartMuseum - Helm Chart Repository server
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
  };
in mkImage {
  inherit drv;
  name = "chartmuseum-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/chartmuseum" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "chartmuseum-fips";
    "org.opencontainers.image.description" = "Helm Chart Repository server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
