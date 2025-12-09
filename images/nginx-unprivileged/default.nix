{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-unprivileged - runs as non-root user (65532)
# Same as nginx but configured to run without root privileges

let
  nginxPackages = with pkgs; [
    nginx
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nginx-unprivileged";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nginx-unprivileged-root";
      paths = base.basePackages ++ nginxPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    User = "65532:65532";
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nginxPackages}"
      "NGINX_ENTRYPOINT_QUIET_LOGS=1"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "nginx running as non-root user";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.image.upstream" = "https://nginx.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "nginx,webserver,proxy,unprivileged";
    };
  };
}
