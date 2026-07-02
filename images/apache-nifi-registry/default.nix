{ mkImage, pkgs, lib, ... }:

# Apache NiFi Registry - versioned control / storage for NiFi flow resources
# https://nifi.apache.org/registry
# Upstream prebuilt distribution: nifi-registry-<ver>-bin.zip (runs on the JVM).
#
# 2.10.0 bumped from 1.28.1 — the older release carried 16 critical
# Java-dep CVEs (bouncycastle 1.79, spring-web 5.3.39, jersey 2.45,
# azure-keyvault 4.8.8). NiFi 2.x is on Spring 6 + BC 1.81 + Jersey
# 3.x, clearing them.

let
  version = "2.10.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "nifi-registry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/nifi/${version}/nifi-registry-${version}-bin.zip";
      hash = "sha256-hnr7mhd5eWbEF7+qjAjJhyHoMoWSEN2ywVZYUeClxdg=";
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
        --set JAVA_HOME ${pkgs.jdk21_headless} \
        --prefix PATH : ${lib.makeBinPath [
          pkgs.jdk21_headless pkgs.coreutils pkgs.gnugrep pkgs.gnused
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
