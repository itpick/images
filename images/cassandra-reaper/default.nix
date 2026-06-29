{ mkImage, pkgs, lib, ... }:

# Cassandra Reaper - automated repair scheduling for Apache Cassandra
# https://github.com/thelastpickle/cassandra-reaper
# Upstream prebuilt release tarball (noarch Java application).

let
  version = "4.2.5";

  cassandra-reaper = pkgs.stdenv.mkDerivation {
    pname = "cassandra-reaper";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/thelastpickle/cassandra-reaper/releases/download/${version}/cassandra-reaper-${version}-release.tar.gz";
      hash = "sha256-hTElQPyYFbk0nRmWFdNh+MEamAkPaICmKDnTqsyIzvA=";
    };

    # Pure JVM application; autoPatchelfHook is a harmless no-op here.
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = "cassandra-reaper-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/cassandra-reaper
      cp -r . $out/share/cassandra-reaper/
      mkdir -p $out/bin
      ln -s $out/share/cassandra-reaper/bin/cassandra-reaper $out/bin/cassandra-reaper
      ln -s $out/share/cassandra-reaper/bin/spreaper $out/bin/spreaper
      chmod +x $out/share/cassandra-reaper/bin/cassandra-reaper $out/share/cassandra-reaper/bin/spreaper
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Automated repair scheduling tool for Apache Cassandra";
      homepage = "https://github.com/thelastpickle/cassandra-reaper";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  drv = cassandra-reaper;
  name = "cassandra-reaper";
  tag = "v${version}";
  entrypoint = [ "${cassandra-reaper}/bin/cassandra-reaper" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    jre
    bash
  ];

  labels = {
    "org.opencontainers.image.title" = "cassandra-reaper";
    "org.opencontainers.image.description" = "Automated repair scheduling for Apache Cassandra";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
