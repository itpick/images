{ mkImage, pkgs, lib, ... }:

# Open Policy Agent (OPA) - general-purpose policy engine
# https://github.com/open-policy-agent/opa
# opa-fips packages the upstream opa linux/amd64 binary.

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "opa-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/open-policy-agent/opa/releases/download/v${version}/opa_linux_amd64";
      sha256 = "1vga16l04mnn64n0nqjl6sb86y8vzkf3kmq0h6x0gp1zzsiqbaqz";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/opa
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "opa-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/opa" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the policy
  # engine's REST API: `run --server`. OPA needs no config file, datastore or
  # writable dir to start (in-memory store; bundles load from read-only paths).
  # IMPORTANT: in OPA v1 (this is v1.18.1) `--addr` defaults to LOCALHOST only,
  # so the kind-test probe couldn't reach it — bind 0.0.0.0:8181 explicitly.
  # Same tool as the sibling `opa` image, whose kind-test validates this cmd.
  cmd = [ "run" "--server" "--addr" "0.0.0.0:8181" ];
  labels = {
    "org.opencontainers.image.title" = "opa-fips";
    "org.opencontainers.image.description" = "Open Policy Agent policy engine";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
