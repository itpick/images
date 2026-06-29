{ mkImage, pkgs, lib, ... }:

# Apache Hop - data orchestration and integration platform
# https://hop.apache.org
# The "-fips" suffix denotes the same upstream tool (Apache Hop); we package the
# official upstream prebuilt client distribution (no FIPS claims made in labels).
# Upstream prebuilt distribution: apache-hop-client-<ver>.zip (runs on the JVM).

let
  version = "2.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-hop";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/hop/${version}/apache-hop-client-${version}.zip";
      hash = "sha256-MlsOzKKRqElkl7caOPXBbup0QgNwbq8Rop3p9DHUs+E=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip pkgs.makeWrapper ];

    # The archive unpacks into a top-level "hop/" directory.
    sourceRoot = "hop";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/hop
      cp -r . $out/share/hop/
      chmod +x $out/share/hop/*.sh || true
      patchShebangs $out/share/hop

      # hop-run.sh builds a relative classpath, so the wrapper changes into the
      # install dir and provides a JRE plus the small unix tools the script uses.
      makeWrapper ${pkgs.bash}/bin/bash $out/bin/hop-run \
        --add-flags "$out/share/hop/hop-run.sh" \
        --run "cd $out/share/hop" \
        --set JAVA_HOME ${pkgs.jdk17_headless} \
        --prefix PATH : ${lib.makeBinPath [
          pkgs.jdk17_headless pkgs.coreutils pkgs.gnugrep pkgs.gnused pkgs.which
        ]}
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache Hop data orchestration and integration platform";
      homepage = "https://hop.apache.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "apache-hop-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/hop-run" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "apache-hop-fips";
    "org.opencontainers.image.description" = "Apache Hop data orchestration platform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
