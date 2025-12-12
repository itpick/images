{ mkImage, pkgs, lib, ... }:

# Mosquitto - MQTT broker
# https://mosquitto.org/

mkImage {
  drv = pkgs.mosquitto;
  name = "mosquitto";
  tag = "v${pkgs.mosquitto.version}";
  entrypoint = [ "${pkgs.mosquitto}/bin/mosquitto" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "Mosquitto";
    "org.opencontainers.image.description" = "Open source MQTT broker";
    "org.opencontainers.image.version" = pkgs.mosquitto.version;
  };
}
