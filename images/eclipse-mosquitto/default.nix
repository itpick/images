{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eclipse-mosquitto - Eclipse Mosquitto MQTT broker
# https://mosquitto.org/

let
  imagePkgs = with pkgs; [
    mosquitto
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # mosquitto 2.x binds only localhost and denies anonymous clients by default,
  # so a bare image isn't reachable by the kind probe (and the stub had no Cmd
  # at all). Bake a minimal broker config: listen on 0.0.0.0:1883 and allow
  # anonymous connections. No persistence and logging to stderr, so no writable
  # dirs are needed. Operators override by mounting their own config.
  mosquittoConfig = pkgs.writeTextDir "etc/mosquitto/mosquitto.conf" ''
    listener 1883 0.0.0.0
    allow_anonymous true
  '';

in nix2container.buildImage {
  name = "eclipse-mosquitto";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.mosquitto.version;
  copyToRoot = [
    (buildEnv {
      name = "eclipse-mosquitto-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv mosquittoConfig ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Run the broker in the foreground with the baked config so the kind-test
    # probe reaches a Running pod with no extra wiring.
    Cmd = [ "mosquitto" "-c" "/etc/mosquitto/mosquitto.conf" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "1883/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "eclipse-mosquitto";
      "org.opencontainers.image.description" = "Eclipse Mosquitto MQTT broker";
      "org.opencontainers.image.version" = pkgs.mosquitto.version;
      "io.nix-containers.image.upstream" = "https://mosquitto.org/";
      "io.nix-containers.image.category" = "message-queue";
      "io.nix-containers.image.aliases" = "mosquitto,mqtt,broker,eclipse-mosquitto";
    };
  };
}
