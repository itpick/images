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

  # Minimal non-root server config. Caddy refuses to start with no config
  # (server-needs-config in KNOWN-LIMITATIONS) and its compile-time defaults
  # bind :80/:443 (privileged). Listen on 8080 (>1024, bindable by the
  # nonroot user), disable the admin endpoint, and answer 200 on /. Operators
  # override by mounting their own /etc/caddy/Caddyfile.
  caddyConfig = pkgs.writeTextDir "etc/caddy/Caddyfile" ''
    {
        admin off
    }

    :8080 {
        respond "OK" 200
    }
  '';

  # Caddy persists state under $XDG_DATA_HOME / $XDG_CONFIG_HOME (pointed at
  # /tmp below). buildEnv otherwise leaves /tmp a read-only store symlink, so
  # materialize it as a real writable dir. Mirrors the nginx scaffold.
  writableDirs = pkgs.runCommand "caddy-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "caddy";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.caddy.version;

  # Separate layers so the writable /tmp scaffold can declare its own perms
  # without colliding with buildEnv's read-only /tmp symlink (same approach as
  # nginx / nginx-unprivileged).
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "caddy-root";
          paths = base.basePackages ++ caddyPackages ++ [ userEnv caddyConfig ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    User = "65532:65532";
    # Charts consuming caddy leave command/args unset, relying on the OCI
    # Entrypoint+Cmd; run caddy in the foreground with the baked config.
    Entrypoint = [ "${pkgs.caddy}/bin/caddy" ];
    Cmd = [ "run" "--config" "/etc/caddy/Caddyfile" "--adapter" "caddyfile" ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath caddyPackages}"
      "XDG_CONFIG_HOME=/tmp"
      "XDG_DATA_HOME=/tmp"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
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
