{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # maddy packages
  maddyPackages = with pkgs; [
    maddy
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal non-root config so the image runs with no Cmd previously and no
  # mounted config (server-needs-config). A single SMTP endpoint on
  # 0.0.0.0:2525 (>1024, nonroot-bindable) that accepts and discards mail
  # (the `dummy` module), TLS off, state/runtime dirs under writable /tmp.
  # Operators override by mounting their own /etc/maddy/maddy.conf.
  maddyConfig = pkgs.writeTextDir "etc/maddy/maddy.conf" ''
    state_dir /tmp/maddy/state
    runtime_dir /tmp/maddy/run
    hostname localhost
    tls off

    smtp tcp://0.0.0.0:2525 {
        deliver_to dummy
    }
  '';

  # maddy writes its state + runtime dirs under /tmp. buildEnv otherwise leaves
  # /tmp a read-only store symlink, so materialize it as a real writable dir.
  writableDirs = pkgs.runCommand "maddy-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "maddy";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.maddy.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "maddy-root";
          paths = base.basePackages ++ maddyPackages ++ [ userEnv maddyConfig ];
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
    # The image had no Cmd. Run maddy in the foreground with the baked config.
    Cmd = [ "maddy" "run" "--config" "/etc/maddy/maddy.conf" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath maddyPackages}"
    ];
    ExposedPorts = {
      "2525/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Composable all-in-one mail server with SMTP and IMAP";
      "org.opencontainers.image.version" = pkgs.maddy.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://maddy.email/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "maddy,mail-server,smtp,imap";
    };
  };
}
