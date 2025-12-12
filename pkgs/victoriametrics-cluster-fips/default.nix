# VictoriaMetrics Cluster FIPS - FIPS 140-3 compliant cluster components
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/
#
# Downloads pre-built FIPS binaries from GitHub enterprise releases:
# - vminsert-fips: Accepts data and distributes it among vmstorage nodes
# - vmselect-fips: Performs queries by fetching data from vmstorage nodes
# - vmstorage-fips: Stores time series data

{ lib, stdenv, fetchurl, autoPatchelfHook }:

let
  version = "1.131.0";

  arch = if stdenv.hostPlatform.isAarch64 then "arm64" else "amd64";

  srcs = {
    amd64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-amd64-v${version}-enterprise-cluster.tar.gz";
      hash = "sha256-w/msLbSyLjPlHQCA/eR7m0W0le+ju3nlIRB0H05AP98=";
    };
    arm64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-arm64-v${version}-enterprise-cluster.tar.gz";
      hash = "sha256-kfiCRejjEW83AonhAFnmBxRla77tafXDs9EohtPxnsI=";
    };
  };

  mkComponent = { name, binary }: stdenv.mkDerivation {
    pname = "${name}-fips";
    inherit version;
    src = srcs.${arch};
    nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];
    sourceRoot = ".";
    installPhase = ''
      mkdir -p $out/bin
      install -m755 ${binary}-prod-fips $out/bin/${name}
    '';
    passthru.isFips = true;
    meta = {
      description = "VictoriaMetrics ${name} FIPS - cluster component";
      homepage = "https://victoriametrics.com/";
      license = lib.licenses.unfree;
      mainProgram = name;
    };
  };

in
stdenv.mkDerivation {
  pname = "victoriametrics-cluster-fips";
  inherit version;

  src = srcs.${arch};

  nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m755 vminsert-prod-fips $out/bin/vminsert
    install -m755 vmselect-prod-fips $out/bin/vmselect
    install -m755 vmstorage-prod-fips $out/bin/vmstorage
    runHook postInstall
  '';

  passthru = {
    inherit version;
    isFips = true;
    vminsert = mkComponent { name = "vminsert"; binary = "vminsert"; };
    vmselect = mkComponent { name = "vmselect"; binary = "vmselect"; };
    vmstorage = mkComponent { name = "vmstorage"; binary = "vmstorage"; };
  };

  meta = with lib; {
    description = "VictoriaMetrics cluster FIPS 140-3 compliant components";
    homepage = "https://victoriametrics.com/";
    license = licenses.unfree; # Enterprise license required
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
