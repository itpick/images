# Package Version Mapping
# =======================
# This file provides version lookup for container images.
# Used for tagging images with their package versions.
#
# Usage:
#   let getVersion = import ./versions.nix { inherit pkgs; };
#   in getVersion "nginx"  # Returns nginx version string

{ pkgs }:

let
  # Helper to ensure version is a string (some packages have structured version objects)
  toVersionString = v: if builtins.isString v then v else toString v;

  # Map image names to their package versions
  versionMap = {
    # Databases
    postgres = toVersionString pkgs.postgresql.version;
    mariadb = toVersionString pkgs.mariadb.version;
    redis = toVersionString pkgs.redis.version;
    valkey = toVersionString pkgs.valkey.version;
    mongodb = toVersionString pkgs.mongodb.version;

    # Web servers
    nginx = toVersionString pkgs.nginx.version;
    caddy = toVersionString pkgs.caddy.version;
    haproxy = toVersionString pkgs.haproxy.version;
    hugo = toVersionString pkgs.hugo.version;

    # Language runtimes
    python = toVersionString pkgs.python3.version;
    python-fips = toVersionString pkgs.python3.version;
    node = toVersionString pkgs.nodejs.version;
    go = toVersionString pkgs.go.version;
    rust = toVersionString pkgs.rustc.version;
    jdk = toVersionString pkgs.openjdk.version;
    jre = toVersionString pkgs.openjdk.version;
    dotnet = toVersionString pkgs.dotnet-sdk.version;
    ruby = toVersionString pkgs.ruby.version;
    php = toVersionString pkgs.php.version;

    # CLI tools
    kubectl = toVersionString pkgs.kubectl.version;
    helm = toVersionString pkgs.kubernetes-helm.version;
    kubernetes-helm = toVersionString pkgs.kubernetes-helm.version;
    cosign = toVersionString pkgs.cosign.version;
    grype = toVersionString pkgs.grype.version;
    crane = toVersionString pkgs.crane.version;
    curl = toVersionString pkgs.curl.version;
    git = toVersionString pkgs.git.version;
    sops = toVersionString pkgs.sops.version;
    bash = toVersionString pkgs.bash.version;
    busybox = toVersionString pkgs.busybox.version;

    # DevOps tools
    docker-compose = toVersionString pkgs.docker-compose.version;
    dive = toVersionString pkgs.dive.version;
    ko = toVersionString pkgs.ko.version;

    # Nix tools
    nix = toVersionString pkgs.nix.version;
    nix-flakes = toVersionString pkgs.nix.version;
    nix-unstable = toVersionString pkgs.nix.version;
    cachix = toVersionString pkgs.cachix.version;
    cachix-flakes = toVersionString pkgs.cachix.version;
    devenv = toVersionString pkgs.devenv.version;
    attic = toVersionString pkgs.attic-client.version;

    # Build tools
    gradle = toVersionString pkgs.gradle.version;
    maven = toVersionString pkgs.maven.version;

    # C/C++ tools
    cpp-build-env = toVersionString pkgs.gcc.version;
    cpp-runtime = toVersionString pkgs.glibc.version;
    rust-build-env = toVersionString pkgs.rustc.version;

    # .NET
    aspnet-runtime = toVersionString pkgs.dotnet-aspnetcore.version;

    # Other
    glibc-dynamic = toVersionString pkgs.glibc.version;
    static = toVersionString pkgs.busybox.version;
    wait-for-it = "1.0.0";
    pocket-id = "1.0.0";
    devcontainer = toVersionString pkgs.bash.version;
    dragonfly-operator = "1.1.11";
    external-dns = "0.16.1";
    maddy = toVersionString pkgs.maddy.version;
  };

in
  # Return a function that looks up version by image name
  imageName: versionMap.${imageName} or "latest"
