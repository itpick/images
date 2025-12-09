{ mkImage, fetchFromGitHub, buildNpmPackage, lib, chromium, ... }:


# Chainguard SBOM packages for grafana-image-renderer:
# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.at-spi2-core  # at-spi2-core (2.58.2-r0)
#   pkgs.brotli  # brotli (1.2.0-r1)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cairo  # cairo (1.18.4-r1)
#   pkgs.chromium  # chromium (142.0.7444.175-r0)
#   pkgs.crc32c  # crc32c (1.1.2-r4)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.double-conversion  # double-conversion (3.3.1-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.fontconfig  # fontconfig (2.17.1-r1)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.fribidi  # fribidi (1.0.16-r2)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.gdk-pixbuf  # gdk-pixbuf (2.44.4-r0)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glycin-loaders  # glycin-2 (2.0.7-r0)
#   pkgs.grafana-image-renderer  # grafana-image-renderer (5.0.11-r1)
#   pkgs.graphene  # graphene (1.10.8-r6)
#   pkgs.graphite2  # graphite2 (1.3.14-r6)
#   pkgs.gtk-mac-integration  # gtk-3 (3.24.51-r0)
#   pkgs.gtk-mac-integration  # gtk-4 (4.21.3-r0)
#   pkgs.harfbuzz  # harfbuzz (12.2.0-r0)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libasyncns  # libasyncns (0.8-r4)
#   ... and 80 more
# Packages NOT in nixpkgs:
#   aom-libs (3.13.1-r0)
#   brotli-dev (1.2.0-r1)
#   cairo-gobject (1.18.4-r1)
#   cups-libs (2.4.16-r0)
#   dbus-libs (1.16.2-r5)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   font-opensans (0_git20210927-r1)
#   fontconfig-config (2.17.1-r1)
#   gst-plugins-bad (1.27.2-r2)
#   gst-plugins-base (1.27.2-r0)
#   gstreamer (1.27.2-r2)
#   heimdal-libs (7.8.0-r42)
#   icu-data-full (75.1-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libatk-1.0 (2.58.2-r0)
#   ... and 49 more

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
mkImage {
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
