{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-hub
# Selenium Grid hub - https://www.selenium.dev/documentation/grid/

let
  # A Grid hub only routes sessions to registered nodes; it never launches
  # browsers itself (that's the node images' job), so chromium/firefox are
  # dropped here — matching upstream's browserless selenium/hub image and
  # keeping the build lean.
  seleniumPkgs = with pkgs; [
    selenium-server-standalone
    jdk21
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "selenium-hub";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.selenium-server-standalone.version;
  copyToRoot = [
    (buildEnv {
      name = "selenium-hub-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Was a bare stub (no Cmd), so the kind-test pod fails with "no command
    # specified". Run the Grid hub in the foreground: -host 0.0.0.0 so nodes and
    # clients (and the kind-test probe) can reach it on :4444. Nodes register to
    # http://<hub>:4444/grid/register/.
    Entrypoint = [ (lib.getExe pkgs.selenium-server-standalone) ];
    Cmd = [ "-role" "hub" "-host" "0.0.0.0" "-port" "4444" ];
    ExposedPorts = {
      "4444/tcp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "selenium-hub";
      "org.opencontainers.image.description" = "Selenium Grid hub";
      "org.opencontainers.image.version" = pkgs.selenium-server-standalone.version;
    };
  };
}
