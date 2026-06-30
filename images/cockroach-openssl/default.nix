{ mkImage, pkgs, lib, ... }:

# CockroachDB (openssl variant) - distributed SQL database
# https://github.com/cockroachdb/cockroach
# Same upstream tool as `cockroach`; official prebuilt static binary.

let
  version = "25.4.11";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cockroach-openssl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://binaries.cockroachdb.com/cockroach-v${version}.linux-amd64.tgz";
      hash = "sha256-joLENwDb9ODG8m7OpzgcwKzN2tbEcs8aOcIVQJtPDV8=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "cockroach-v${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 cockroach $out/bin/cockroach
      # GEOS spatial libs are searched relative to the binary dir (<bindir>/lib)
      install -Dm755 lib/libgeos.so $out/bin/lib/libgeos.so
      install -Dm755 lib/libgeos_c.so $out/bin/lib/libgeos_c.so
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "cockroach-openssl";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cockroach" ];
  # Was `version` (a one-shot, so the kind-test pod CrashLoops). Run a real,
  # long-lived server: start-single-node is CockroachDB's standalone mode (no
  # join/cluster-init needed). --insecure drops the TLS + auth requirement so
  # the image starts with no mounted certs (operators run secure with their own
  # certs + --join), and both the SQL (:26257) and admin-UI/health (:8080)
  # listeners bind 0.0.0.0 so the kind-test probe can reach them. --store points
  # at the writable /tmp (nonroot can't write the default ./cockroach-data).
  # Mirrors the sibling `cockroach` image (same binary), validated by its
  # kind-test.
  cmd = [
    "start-single-node"
    "--insecure"
    "--listen-addr=0.0.0.0:26257"
    "--http-addr=0.0.0.0:8080"
    "--store=/tmp/cockroach-data"
  ];
  labels = {
    "org.opencontainers.image.title" = "cockroach-openssl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
