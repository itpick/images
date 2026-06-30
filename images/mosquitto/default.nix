{ mkImage, pkgs, lib, ... }:

# Mosquitto - MQTT broker
# https://mosquitto.org/

let
  # Mosquitto 2.x defaults to listening only on localhost and rejecting
  # anonymous clients, so the bare broker isn't reachable. Bake a minimal config
  # at /etc/mosquitto.conf (a sibling of the package's own /etc/mosquitto/ dir,
  # so there's no same-path shadowing): listen on 0.0.0.0:1883, allow anonymous,
  # and disable persistence (so no writable data dir is needed). Operators mount
  # their own config with auth + a persistence dir.
  mosquittoConfig = pkgs.writeTextDir "etc/mosquitto.conf" ''
    listener 1883 0.0.0.0
    allow_anonymous true
    persistence false
  '';

in
mkImage {
  drv = pkgs.mosquitto;
  name = "mosquitto";
  tag = "v${pkgs.mosquitto.version}";
  entrypoint = [ "${pkgs.mosquitto}/bin/mosquitto" ];
  # Was `-h` (a one-shot). Run the broker in the foreground with the baked
  # config; it serves MQTT on 0.0.0.0:1883.
  cmd = [ "-c" "/etc/mosquitto.conf" ];

  extraPkgs = [ mosquittoConfig ];

  labels = {
    "org.opencontainers.image.title" = "Mosquitto";
    "org.opencontainers.image.description" = "Open source MQTT broker";
    "org.opencontainers.image.version" = pkgs.mosquitto.version;
  };
}
