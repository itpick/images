{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pyroscope
# =========
# Continuous profiling platform for application performance
# https://github.com/grafana/pyroscope

let
  appPackages = with pkgs; [
    pyroscope
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
nix2container.buildImage {
  name = "pyroscope";
  tag = "v${pkgs.pyroscope.version}";

  copyToRoot = [
    (buildEnv {
      name = "pyroscope-root";
      paths = base.basePackages ++ appPackages ++ [ userEnv ];
    })
  ];

  config = {
    Entrypoint = [ "${pkgs.pyroscope}/bin/pyroscope" ];
    User = "1000:1000";
    ExposedPorts = {
      "4040/tcp" = {};
    };
    Labels = {
      "org.opencontainers.image.title"       = "Pyroscope";
      "org.opencontainers.image.description" = "Continuous profiling platform for application performance";
      "org.opencontainers.image.version"     = pkgs.pyroscope.version;
      "org.opencontainers.image.source"      = "https://github.com/grafana/pyroscope";
      "io.nix-containers.build-strategy"     = "nixpkgs-wrapped";
      "io.nix-containers.image.category"     = "observability,profiling";
    };
  };
}
