# VictoriaMetrics FIPS - FIPS 140-3 compliant time series database
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/
#
# Downloads pre-built FIPS binaries from GitHub enterprise releases
# These builds use Google's FIPS 140-3 validated BoringCrypto module

{ lib, stdenv, fetchurl, autoPatchelfHook }:

let
  version = "1.131.0";

  arch = if stdenv.hostPlatform.isAarch64 then "arm64" else "amd64";

  srcs = {
    amd64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-amd64-v${version}-enterprise.tar.gz";
      hash = "sha256-afyvTMhgGRBaGmRA76Ez7Df5UuCjJFlCrKCzfC+aeh0=";
    };
    arm64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/victoria-metrics-linux-arm64-v${version}-enterprise.tar.gz";
      hash = "sha256-LxouPiGk4uYp14DXi+2dybBsKqbXnksOtiSqo4Xm/BU=";
    };
  };

in
stdenv.mkDerivation {
  pname = "victoriametrics-fips";
  inherit version;

  src = srcs.${arch};

  nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    # Install the FIPS binary
    install -m755 victoria-metrics-prod-fips $out/bin/victoria-metrics
    runHook postInstall
  '';

  passthru = {
    inherit version;
    isFips = true;
  };

  meta = with lib; {
    description = "VictoriaMetrics FIPS 140-3 compliant build";
    homepage = "https://victoriametrics.com/";
    license = licenses.unfree; # Enterprise license required
    mainProgram = "victoria-metrics";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
