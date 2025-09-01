{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  haproxyPackages = with pkgs; [
    haproxy
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "haproxy";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "haproxy-root";
      paths = base.basePackages ++ haproxyPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath haproxyPackages}"
    ];
    ExposedPorts = {
      "80/tcp" = {};
      "443/tcp" = {};
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "High-performance TCP/HTTP load balancer";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.haproxy.version;
      "io.nix-containers.image.upstream" = "https://www.haproxy.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "haproxy,loadbalancer,proxy,lb";
    };
  };
}