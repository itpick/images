{ mkImage, pkgs, lib, ... }:

# ChartMuseum - Helm Chart Repository server
# https://github.com/helm/chartmuseum (official binaries on get.helm.sh)
let
  version = "0.16.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "chartmuseum";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://get.helm.sh/chartmuseum-v${version}-linux-amd64.tar.gz";
      hash = "sha256:1bn1dr6gh0g4ha5xx2mbgvy2ay00kpb7gb9qsn5ywarpmw6nlzb8";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 linux-amd64/chartmuseum $out/bin/chartmuseum
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "helm-chartmuseum-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/chartmuseum" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "helm-chartmuseum-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
