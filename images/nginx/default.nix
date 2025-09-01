{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # nginx packages
  nginxPackages = with pkgs; [
    nginx
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nginx";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nginx-root";
      paths = base.basePackages ++ nginxPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nginxPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "High-performance HTTP server and reverse proxy";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.image.upstream" = "https://nginx.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "nginx,webserver,proxy";
    };
  };
}
