{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# configurable-http-proxy - node-http-proxy with a REST API (JupyterHub's CHP)
# https://github.com/jupyterhub/configurable-http-proxy

let
  imagePkgs = with pkgs; [
    configurable-http-proxy
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "configurable-http-proxy";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.configurable-http-proxy.version;
  copyToRoot = [
    (buildEnv {
      name = "configurable-http-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # The stub had no Cmd. Run the proxy + REST API in the foreground bound to
    # all interfaces (both ports >1024, bindable by the nonroot user). CHP is
    # stateless (routes are added at runtime via the API), so it needs no
    # config file and no writable dirs; with no routes it serves 404 and the
    # process stays up — enough for the kind probe to see a Running pod.
    Cmd = [
      "configurable-http-proxy"
      "--ip" "0.0.0.0" "--port" "8000"
      "--api-ip" "0.0.0.0" "--api-port" "8001"
    ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "8000/tcp" = {};
      "8001/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "configurable-http-proxy";
      "org.opencontainers.image.description" = "Configurable HTTP proxy with a REST API (JupyterHub CHP)";
      "org.opencontainers.image.version" = pkgs.configurable-http-proxy.version;
      "io.nix-containers.image.upstream" = "https://github.com/jupyterhub/configurable-http-proxy";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "configurable-http-proxy,chp,proxy";
    };
  };
}
