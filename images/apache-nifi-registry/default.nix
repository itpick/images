{ mkImage, pkgs, lib, ... }:

# Apache NiFi Registry - versioned control / storage for NiFi flow resources
# https://nifi.apache.org/registry  (standalone registry, last 1.x line)
# Upstream prebuilt distribution: nifi-registry-<ver>-bin.zip (runs on the JVM).

let
  version = "1.28.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "nifi-registry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/nifi/${version}/nifi-registry-${version}-bin.zip";
      hash = "sha256-SPKW+WOnCJIawhGBJvRbflh3jB2Syqi13Ikj8dRKqZU=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip pkgs.makeWrapper ];

    # The archive unpacks into a top-level "nifi-registry-<ver>/" directory.
    sourceRoot = "nifi-registry-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share
      cp -r . $out/share/nifi-registry
      chmod +x $out/share/nifi-registry/bin/*.sh
      patchShebangs $out/share/nifi-registry/bin

      makeWrapper ${pkgs.bash}/bin/bash $out/bin/nifi-registry \
        --add-flags "$out/share/nifi-registry/bin/nifi-registry.sh" \
        --set JAVA_HOME ${pkgs.jdk17_headless} \
        --prefix PATH : ${lib.makeBinPath [
          pkgs.jdk17_headless pkgs.coreutils pkgs.gnugrep pkgs.gnused
          pkgs.gawk pkgs.which pkgs.findutils pkgs.procps
        ]}
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache NiFi Registry - storage and management of versioned flows";
      homepage = "https://nifi.apache.org/registry";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "apache-nifi-registry";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/nifi-registry" ];
  cmd = [ "run" ];

  labels = {
    "org.opencontainers.image.title" = "apache-nifi-registry";
    "org.opencontainers.image.description" = "Apache NiFi Registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
