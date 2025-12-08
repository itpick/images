{ buildCLIImage, fetchFromGitHub, buildNpmPackage, lib, chromium, ... }:

let
  version = "3.11.6";
  grafana-image-renderer = buildNpmPackage {
    pname = "grafana-image-renderer";
    inherit version;

    src = fetchFromGitHub {
      owner = "grafana";
      repo = "grafana-image-renderer";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    env.PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";

    postInstall = ''
      wrapProgram $out/bin/grafana-image-renderer \
        --set CHROME_BIN "${chromium}/bin/chromium"
    '';

    meta = with lib; {
      description = "Grafana image renderer plugin";
      homepage = "https://github.com/grafana/grafana-image-renderer";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = grafana-image-renderer;
  name = "grafana-image-renderer";
  tag = "v${version}";
  entrypoint = [ "${grafana-image-renderer}/bin/grafana-image-renderer" ];
  cmd = [ "server" ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Image Renderer";
    "org.opencontainers.image.description" = "Grafana plugin for rendering panels as images";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
