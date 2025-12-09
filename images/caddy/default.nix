{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for caddy:
# Packages available in nixpkgs:
#   pkgs.caddy  # caddy (2.10.2-r6)

let
  # Caddy packages
  caddyPackages = with pkgs; [
    caddy
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "caddy";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "caddy-root";
      paths = base.basePackages ++ caddyPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath caddyPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Powerful web server with automatic HTTPS";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.caddy.version;
      "io.nix-containers.image.upstream" = "https://caddyserver.com/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "caddy,webserver,proxy,https";
    };
  };
}
