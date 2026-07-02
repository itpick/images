# VictoriaMetrics Utils FIPS - FIPS 140-3 compliant utility components
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/
#
# Downloads pre-built FIPS binaries from GitHub enterprise releases:
# - vmagent-fips: Lightweight metrics collector
# - vmalert-fips: Alerting and recording rules executor
# - vmauth-fips: Authentication proxy and load balancer

{ lib, stdenv, fetchurl, autoPatchelfHook }:

let
  version = "1.146.0";

  arch = if stdenv.hostPlatform.isAarch64 then "arm64" else "amd64";

  srcs = {
    amd64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/vmutils-linux-amd64-v${version}-enterprise.tar.gz";
      hash = "sha256-wicKJfTy0idv6LSSurpUthyjnk05JIJhRlrhqjq6BMk=";
    };
    arm64 = fetchurl {
      url = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${version}/vmutils-linux-arm64-v${version}-enterprise.tar.gz";
      hash = "sha256-WIdB9ejGbrhUhVSQ70L6APInakXlUDI53RmfGyXR1zc=";
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
      description = "VictoriaMetrics ${name} FIPS - utility component";
      homepage = "https://victoriametrics.com/";
      license = lib.licenses.unfree;
      mainProgram = name;
    };
  };

in
stdenv.mkDerivation {
  pname = "victoriametrics-utils-fips";
  inherit version;

  src = srcs.${arch};

  nativeBuildInputs = lib.optionals (!stdenv.hostPlatform.isAarch64) [ autoPatchelfHook ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m755 vmagent-prod-fips $out/bin/vmagent
    install -m755 vmalert-prod-fips $out/bin/vmalert
    install -m755 vmauth-prod-fips $out/bin/vmauth
    install -m755 vmbackup-prod-fips $out/bin/vmbackup
    install -m755 vmrestore-prod-fips $out/bin/vmrestore
    install -m755 vmctl-prod-fips $out/bin/vmctl
    runHook postInstall
  '';

  passthru = {
    inherit version;
    isFips = true;
    vmagent = mkComponent { name = "vmagent"; binary = "vmagent"; };
    vmalert = mkComponent { name = "vmalert"; binary = "vmalert"; };
    vmauth = mkComponent { name = "vmauth"; binary = "vmauth"; };
    vmbackup = mkComponent { name = "vmbackup"; binary = "vmbackup"; };
    vmrestore = mkComponent { name = "vmrestore"; binary = "vmrestore"; };
    vmctl = mkComponent { name = "vmctl"; binary = "vmctl"; };
  };

  meta = with lib; {
    description = "VictoriaMetrics utils FIPS 140-3 compliant components";
    homepage = "https://victoriametrics.com/";
    license = licenses.unfree; # Enterprise license required
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
