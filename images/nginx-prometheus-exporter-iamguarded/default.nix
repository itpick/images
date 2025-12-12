{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-prometheus-exporter-iamguarded
# Nginx component

let
  nginxPkgs = with pkgs; [
    nginx
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "nginx-prometheus-exporter-iamguarded";
  tag = pkgs.nginx.version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-prometheus-exporter-iamguarded-root";
      paths = base.basePackages ++ nginxPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-g" "daemon off;" ];
    ExposedPorts = { "80/tcp" = {}; "443/tcp" = {}; };
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx-prometheus-exporter-iamguarded";
      "org.opencontainers.image.description" = "Nginx nginx-prometheus-exporter-iamguarded";
      "org.opencontainers.image.version" = pkgs.nginx.version;
    };
  };
}
