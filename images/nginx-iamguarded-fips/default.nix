{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-iamguarded-fips
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
  name = "nginx-iamguarded-fips";
  tag = pkgs.nginx.version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-iamguarded-fips-root";
      paths = base.basePackages ++ nginxPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-g" "daemon off;" ];
    ExposedPorts = { "80/tcp" = {}; "443/tcp" = {}; };
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx-iamguarded-fips";
      "org.opencontainers.image.description" = "Nginx nginx-iamguarded";
      "org.opencontainers.image.version" = pkgs.nginx.version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
