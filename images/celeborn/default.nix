{ mkImage, pkgs, lib, ... }:

# Apache Celeborn - intermediate data service for big data compute engines
# https://celeborn.apache.org / https://github.com/apache/celeborn
# Upstream prebuilt binary distribution (noarch JVM application).

let
  version = "0.6.3";

  celeborn = pkgs.stdenv.mkDerivation {
    pname = "celeborn";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/celeborn/celeborn-${version}/apache-celeborn-${version}-bin.tgz";
      hash = "sha256-r2ar55WmiICSQ5g0f+zGB+1tmfWhNQgagO2ZYXbmzto=";
    };

    # Pure JVM application; autoPatchelfHook is a harmless no-op here.
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = "apache-celeborn-${version}-bin";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/celeborn
      cp -r . $out/share/celeborn/
      mkdir -p $out/bin
      ln -s $out/share/celeborn/sbin/celeborn-cli $out/bin/celeborn-cli
      chmod +x $out/share/celeborn/sbin/*.sh $out/share/celeborn/sbin/celeborn-cli $out/share/celeborn/bin/* || true
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Apache Celeborn intermediate data service (remote shuffle service)";
      homepage = "https://celeborn.apache.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  drv = celeborn;
  name = "celeborn";
  tag = "v${version}";
  entrypoint = [ "${celeborn}/bin/celeborn-cli" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    jre
    bash
  ];

  labels = {
    "org.opencontainers.image.title" = "celeborn";
    "org.opencontainers.image.description" = "Apache Celeborn intermediate data / remote shuffle service";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}