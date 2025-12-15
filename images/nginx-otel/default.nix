{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-otel
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
  name = "nginx-otel";
  tag = pkgs.nginx.version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-otel-root";
      paths = base.basePackages ++ nginxPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-g" "daemon off;" ];
    ExposedPorts = { "80/tcp" = {}; "443/tcp" = {}; };
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx-otel";
      "org.opencontainers.image.description" = "Nginx nginx-otel";
      "org.opencontainers.image.version" = pkgs.nginx.version;
    };
  };
}
