# VictoriaMetrics Cluster - High-performance time series database cluster components
# https://github.com/VictoriaMetrics/VictoriaMetrics
#
# Downloads pre-built binaries from GitHub releases:
# - vminsert: Accepts data and distributes it among vmstorage nodes
# - vmselect: Performs queries by fetching data from vmstorage nodes
# - vmstorage: Stores time series data

{ lib, stdenv, fetchurl, autoPatchelfHook }:

let
  version = "1.131.0";

  arch = if stdenv.hostPlatform.isAarch64 then "arm64" else "amd64";

  srcs = {
    amd64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-amd64-v${version}-cluster.tar.gz";
      hash = "sha256-g/yGkqcDeYlqQi31bT53uvhjTDcitCoJqYa0iuRvpd4=";
    };
    arm64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-arm64-v${version}-cluster.tar.gz";
      hash = "sha256-PjgdYHmPCDkKp2JWd/eC9Uws0A4thBz7BVgO+4MLVQg=";
    };
  };

  mkComponent = { name, binary }: stdenv.mkDerivation {
    pname = name;
    inherit version;
    src = srcs.${arch};
    nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];
    sourceRoot = ".";
    installPhase = ''
      mkdir -p $out/bin
      install -m755 ${binary}-prod $out/bin/${name}
    '';
    meta = {
      description = "VictoriaMetrics ${name} - cluster component";
      homepage = "https://victoriametrics.com/";
      license = lib.licenses.asl20;
      mainProgram = name;
    };
  };

in
stdenv.mkDerivation {
  pname = "victoriametrics-cluster";
  inherit version;

  src = srcs.${arch};

  nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m755 vminsert-prod $out/bin/vminsert
    install -m755 vmselect-prod $out/bin/vmselect
    install -m755 vmstorage-prod $out/bin/vmstorage
    runHook postInstall
  '';

  passthru = {
    inherit version;
    vminsert = mkComponent { name = "vminsert"; binary = "vminsert"; };
    vmselect = mkComponent { name = "vmselect"; binary = "vmselect"; };
    vmstorage = mkComponent { name = "vmstorage"; binary = "vmstorage"; };
  };

  meta = with lib; {
    description = "VictoriaMetrics cluster components";
    homepage = "https://victoriametrics.com/";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
