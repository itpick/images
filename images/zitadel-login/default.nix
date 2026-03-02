# zitadel-login
# =============
# ZITADEL Login UI - Next.js-based login interface for ZITADEL
# https://github.com/zitadel/zitadel (apps/login/)
#
# This is the standalone login UI component of ZITADEL, a cloud-native
# identity management platform. It is a Next.js application that provides
# the login/authentication flow UI (Login V2).
#
# The app runs on Node.js and serves on port 3000 at /ui/v2/login/.
# It communicates with the main ZITADEL backend via gRPC/connectRPC.
#
# Upstream image: ghcr.io/zitadel/zitadel-login:v4.10.1

{ nix2container, pkgs, lib, nonRoot, ... }:

let
  version = "4.10.1";

  zitadel-login = pkgs.zitadel-login;

  # Entrypoint script that handles env files and service user tokens
  entrypointScript = pkgs.writeShellScript "entrypoint.sh" ''
    if [ -f /.env-file/.env ]; then
        set -o allexport
        . /.env-file/.env
        set +o allexport
    fi

    if [ -n "''${ZITADEL_SERVICE_USER_TOKEN_FILE}" ]; then
        echo "ZITADEL_SERVICE_USER_TOKEN_FILE=''${ZITADEL_SERVICE_USER_TOKEN_FILE} is set. Awaiting file and reading token."
        while [ ! -f "''${ZITADEL_SERVICE_USER_TOKEN_FILE}" ]; do
            sleep 2
        done
        echo "token file found, reading token"
        export ZITADEL_SERVICE_USER_TOKEN=$(cat "''${ZITADEL_SERVICE_USER_TOKEN_FILE}")
    fi

    exec "$@"
  '';

  # Healthcheck script
  healthcheckScript = pkgs.writeText "healthcheck.js" ''
    const url = process.argv[2];

    if (!url) {
      console.error("No URL provided as command line argument.");
      process.exit(1);
    }

    try {
      const res = await fetch(url);
      if (!res.ok) process.exit(1);
      process.exit(0);
    } catch (e) {
      process.exit(1);
    }
  '';

  # Create the /app directory structure matching upstream layout
  appDir = pkgs.runCommand "zitadel-login-app" {} ''
    mkdir -p $out/app

    # Copy the extracted app contents (use --no-preserve=mode to make writable)
    cp -r --no-preserve=mode ${zitadel-login}/lib/zitadel-login/* $out/app/

    # Install entrypoint and healthcheck scripts
    cp ${entrypointScript} $out/app/entrypoint.sh
    chmod +x $out/app/entrypoint.sh
    cp ${healthcheckScript} $out/app/healthcheck.js
  '';

  # Create required directories for the nextjs user
  userDirs = pkgs.runCommand "zitadel-login-dirs" {} ''
    mkdir -p $out/tmp
    mkdir -p $out/home/nonroot
  '';

in
nix2container.buildImage {
  name = "zitadel-login";
  tag = "v${version}";

  layers = [
    # Base layer with Node.js and system tools
    (nix2container.buildLayer {
      copyToRoot = [
        pkgs.nodejs_22
        pkgs.busybox
        pkgs.cacert
        userDirs
      ];
      perms = [
        {
          path = userDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })

    # Application layer
    (nix2container.buildLayer {
      copyToRoot = [ appDir ];
    })
  ];

  config = {
    Entrypoint = [ "/app/entrypoint.sh" "${pkgs.nodejs_22}/bin/node" "apps/login/server.js" ];
    WorkingDir = "/app";
    User = nonRoot.userString;
    ExposedPorts = {
      "3000/tcp" = {};
    };
    Env = [
      "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      "PATH=${pkgs.nodejs_22}/bin:${pkgs.busybox}/bin"
      "NODE_ENV=production"
      "PORT=3000"
      "HOSTNAME=::"
    ];
    Labels = {
      "org.opencontainers.image.title" = "zitadel-login";
      "org.opencontainers.image.description" = "ZITADEL Login UI - Next.js-based login interface for ZITADEL identity management";
      "org.opencontainers.image.version" = version;
      "org.opencontainers.image.source" = "https://github.com/zitadel/zitadel";
      "org.opencontainers.image.documentation" = "https://zitadel.com/docs";
      "org.opencontainers.image.vendor" = "ZITADEL";
      "org.opencontainers.image.licenses" = "Apache-2.0";
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built Next.js app extracted from upstream Docker image";
    };
  };
}
