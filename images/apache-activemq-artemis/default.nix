{ mkImage, pkgs, lib, ... }:

# Apache ActiveMQ Artemis - high-performance, multi-protocol message broker
# https://activemq.apache.org/components/artemis/
# Upstream ships an official prebuilt "-bin" distribution (JVM app + native libs);
# run the launcher with a JRE on PATH.

let
  version = "2.44.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-activemq-artemis";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/activemq/activemq-artemis/${version}/apache-artemis-${version}-bin.tar.gz";
      hash = "sha256:0a9y3qfrch3k1733ndkspjxgfg7g2bphnxfdc5ikgxhsil534c0h";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    # libaio provides libaio.so.1, needed by the bundled native journal library
    # (artemis/bin/lib/linux-x86_64/libartemis-native-64.so). Without it,
    # autoPatchelfHook fails: "could not satisfy dependency libaio.so.1".
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.libaio ];

    sourceRoot = "apache-artemis-${version}";

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/artemis
      cp -r . $out/artemis/
      mkdir -p $out/bin
      ln -s $out/artemis/bin/artemis $out/bin/artemis
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache ActiveMQ Artemis message broker";
      homepage = "https://activemq.apache.org/components/artemis/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # `artemis run` requires a broker *instance* (its own etc/broker.xml + data
  # dir), which the bare distribution doesn't have — the old `cmd = [ "help" ]`
  # was a one-shot that exits, so the kind-test pod CrashLoops. Create a broker
  # instance under the writable /tmp on first start (non-interactive), then run
  # it. --host/--http-host 0.0.0.0 so the acceptor (61616: CORE/AMQP/MQTT/STOMP/
  # OpenWire) and the web console (8161) are reachable. Operators override the
  # user/password via env or mount their own broker instance at ARTEMIS_BROKER_HOME.
  # writeShellApplication runs shellcheck at build time.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.jre pkgs.coreutils ];
    text = ''
      BROKER="''${ARTEMIS_BROKER_HOME:-/tmp/broker}"
      if [ ! -f "$BROKER/etc/broker.xml" ]; then
        "${drv}/bin/artemis" create "$BROKER" \
          --user "''${ARTEMIS_USER:-artemis}" \
          --password "''${ARTEMIS_PASSWORD:-artemis}" \
          --allow-anonymous \
          --host 0.0.0.0 \
          --http-host 0.0.0.0 \
          --no-autotune \
          --silent
      fi
      exec "$BROKER/bin/artemis" run
    '';
  };

  # `artemis create` generates $BROKER/bin/artemis as a bash script with
  # a `#!/usr/bin/env bash` shebang. Our image doesn't ship /usr/bin/env
  # (Nix keeps everything in /nix/store), so kernel exec fails with
  # "/usr/bin/env: bad interpreter: No such file or directory". Provide
  # the symlink at /usr/bin/env so the generated scripts run.
  usrBinEnv = pkgs.runCommand "usr-bin-env" {} ''
    mkdir -p $out/usr/bin
    ln -s ${pkgs.coreutils}/bin/env $out/usr/bin/env
  '';

in mkImage {
  inherit drv;
  name = "apache-activemq-artemis";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = [ pkgs.jre usrBinEnv ];

  env = {
    # Artemis' launcher + the JVM write only under the broker instance (in /tmp);
    # keep any JVM prefs write off the read-only rootfs too.
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "apache-activemq-artemis";
    "org.opencontainers.image.description" = "Apache ActiveMQ Artemis message broker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
