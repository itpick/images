{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # pocket-id packages
  pocket_idPackages = with pkgs; [
    pocket-id
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # pocket-id persists a SQLite DB + generated keys under its data dir. With
  # WorkingDir=/tmp and DATA_DIR=/tmp/pocket-id (below), everything lands in
  # writable /tmp. buildEnv otherwise leaves /tmp a read-only store symlink, so
  # materialize it as a real writable dir.
  writableDirs = pkgs.runCommand "pocket-id-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "pocket-id";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.pocket-id.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "pocket-id-root";
          paths = base.basePackages ++ pocket_idPackages ++ [ userEnv ];
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
    # The stub had no Cmd. Run the server; data + keys go under writable /tmp.
    WorkingDir = "/tmp";
    Cmd = [ "pocket-id" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath pocket_idPackages}"
      "DATA_DIR=/tmp/pocket-id"
      "APP_URL=http://localhost:1411"
      "HOST=0.0.0.0"
      "PORT=1411"
      "TRUST_PROXY=true"
      # pocket-id refuses to start without an ENCRYPTION_KEY (>=16 bytes) that
      # encrypts the SQLite-stored secrets. This is a smoke-test-friendly
      # placeholder so the image runs out of the box; PRODUCTION DEPLOYMENTS
      # MUST override it with their own secret.
      "ENCRYPTION_KEY=change-me-pocket-id-default-key!"
    ];
    ExposedPorts = {
      "1411/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Lightweight self-hosted identity provider with OAuth2 and OpenID Connect";
      "org.opencontainers.image.version" = pkgs.pocket-id.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://github.com/pocket-id/pocket-id";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "pocket-id,oauth2,oidc,identity";
    };
  };
}
