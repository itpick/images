{ mkImage, pkgs, lib, ... }:

# Elastic APM Server (apm-server-fips variant) - upstream prebuilt release binary
# https://github.com/elastic/apm-server / https://www.elastic.co/apm
# The -fips suffix is an upstream naming variant; this packages the upstream apm-server binary.

let
  version = "9.4.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apm-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.elastic.co/downloads/apm-server/apm-server-${version}-linux-x86_64.tar.gz";
      hash = "sha256-qg9uCMsYPH5c2no3uCIr9qtNstQp0s/ErE7grXtJw/w=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    sourceRoot = "apm-server-${version}-linux-x86_64";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/apm-server
      cp -r . $out/share/apm-server/
      install -Dm755 apm-server $out/bin/apm-server
      runHook postInstall
    '';
  };
  # apm-server needs a config; bake a minimal one (the binary ships no /etc, so
  # no shadowing). Bind the intake API on 0.0.0.0:8200 and use the `console`
  # output so it runs with no Elasticsearch backend. Mirrors the sibling
  # `apm-server` image (same binary), whose kind-test validates this.
  apmConfig = pkgs.writeTextDir "etc/apm-server/apm-server.yml" ''
    apm-server:
      host: "0.0.0.0:8200"

    output.console:
      pretty: false
  '';
in mkImage {
  inherit drv;
  name = "apm-server-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/apm-server" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the intake
  # server with the baked config; log to stderr (-e), and keep apm-server's home
  # (its bundled assets) + a writable data dir explicit (the default data dir is
  # the read-only install tree).
  cmd = [
    "-e"
    "-c" "/etc/apm-server/apm-server.yml"
    "--path.home" "${drv}/share/apm-server"
    "--path.data" "/tmp/apm-server"
  ];

  extraPkgs = [ apmConfig ];
  labels = {
    "org.opencontainers.image.title" = "apm-server-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}