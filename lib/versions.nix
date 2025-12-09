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

    # Chart images - observability
    prometheus = toVersionString pkgs.prometheus.version;
    alertmanager = toVersionString pkgs.prometheus-alertmanager.version;
    grafana = toVersionString pkgs.grafana.version;
    loki = toVersionString pkgs.grafana-loki.version;
    tempo = toVersionString pkgs.tempo.version;
    thanos = toVersionString pkgs.thanos.version;
    alloy = toVersionString pkgs.grafana-alloy.version;
    node-exporter = toVersionString pkgs.prometheus-node-exporter.version;
    kube-state-metrics = toVersionString pkgs.kube-state-metrics.version;
    prometheus-operator = "0.77.1";  # Built from source
    prometheus-adapter = "0.12.0";  # Built from source

    # Chart images - security - Vault
    vault = toVersionString pkgs.vault.version;
    vault-k8s = "1.4.1";  # Built from source
    vault-csi-provider = "1.4.2";  # Built from source

    # Chart images - security - Kyverno
    kyverno = toVersionString pkgs.kyverno.version;
    kyverno-cli = toVersionString pkgs.kyverno.version;
    kyvernopre = "1.13.0";  # Built from source
    kyverno-background-controller = "1.13.0";  # Built from source
    kyverno-cleanup-controller = "1.13.0";  # Built from source
    kyverno-reports-controller = "1.13.0";  # Built from source

    # Chart images - security - Other
    dex = toVersionString pkgs.dex-oidc.version;
    oauth2-proxy = toVersionString pkgs.oauth2-proxy.version;
    external-secrets = "0.10.0";  # Built from source
    kube-rbac-proxy = "0.18.0";  # Built from source

    # Chart images - security - cert-manager
    cert-manager-controller = "1.16.2";  # Built from source
    cert-manager-webhook = "1.16.2";  # Built from source
    cert-manager-cainjector = "1.16.2";  # Built from source
    cert-manager-startupapicheck = toVersionString pkgs.cmctl.version;

    # Chart images - gitops
    argocd = toVersionString pkgs.argocd.version;
    argocd-extension-installer = "0.0.5";  # Built from source

    # Chart images - operators - KEDA
    keda = "2.16.1";  # Built from source
    keda-metrics-apiserver = "2.16.1";  # Built from source
    keda-admission-webhooks = "2.16.1";  # Built from source

    # Chart images - operators - Other
    velero = toVersionString pkgs.velero.version;

    # Chart images - storage
    minio = toVersionString pkgs.minio.version;
    minio-client = toVersionString pkgs.minio-client.version;
    memcached = toVersionString pkgs.memcached.version;
    seaweedfs = toVersionString pkgs.seaweedfs.version;

    # Chart images - git
    gitea = toVersionString pkgs.gitea.version;

    # Chart images - postgresql
    pgpool = toVersionString pkgs.pgpool.version;
    postgres-exporter = toVersionString pkgs.prometheus-postgres-exporter.version;
    cloudnative-pg = "1.27.1";  # Built from source

    # Chart images - flux cd
    flux-cli = toVersionString pkgs.fluxcd.version;
    flux-operator = toVersionString pkgs.fluxcd-operator.version;
    source-controller = "1.7.4";  # Built from source
    kustomize-controller = "1.7.3";  # Built from source
    helm-controller = "1.4.5";  # Built from source
    notification-controller = "1.7.5";  # Built from source
    image-automation-controller = "1.0.4";  # Built from source
    image-reflector-controller = "1.0.4";  # Built from source

    # Chart images - other
    zookeeper = toVersionString pkgs.zookeeper.version;
    openldap = toVersionString pkgs.openldap.version;
    bats = toVersionString pkgs.bats.version;
    shellcheck = toVersionString pkgs.shellcheck.version;
    geoipupdate = toVersionString pkgs.geoipupdate.version;

    # Chart images - additional observability
    blackbox-exporter = toVersionString pkgs.prometheus-blackbox-exporter.version;
    memcached-exporter = "0.15.0";  # Built from source (not in nixpkgs)
    redis-exporter = toVersionString pkgs.prometheus-redis-exporter.version;
    metrics-server = "0.7.2";  # Built from source (not in nixpkgs)
    mimir = toVersionString pkgs.mimir.version;
    grafana-image-renderer = "3.11.6";  # Built from source
    rollout-operator = "0.20.0";  # Built from source
    prometheus-config-reloader = "0.77.1";  # Built from source

    # Chart images - networking
    fluent-bit = toVersionString pkgs.fluent-bit.version;
    traefik = toVersionString pkgs.traefik.version;
    node-local-dns = "1.23.1";  # Built from source

    # Chart images - security
    gatekeeper = toVersionString pkgs.gatekeeper.version;
    trust-manager = "0.12.0";  # Built from source

    # Chart images - utilities
    yq = toVersionString pkgs.yq-go.version;
    configmap-reload = "0.14.0";  # Built from source
    k8s-sidecar = "1.28.0";  # Built from source

    # Chart images - operators and controllers
    crossplane = toVersionString pkgs.crossplane-cli.version;
    gitlab-runner = toVersionString pkgs.gitlab-runner.version;
    snapshot-controller = "8.1.0";  # Built from source
    spegel = "0.0.27";  # Built from source
    reloader = "1.2.1";  # Built from source
    reflector = "9.1.41";  # Built from source
    ingress-nginx = "1.12.0";  # Built from source
  };

in
  # Return a function that looks up version by image name
  imageName: versionMap.${imageName} or "latest"
