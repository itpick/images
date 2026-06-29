{ mkImage, pkgs, lib, ... }:

# Camunda 8 (Zeebe) - distributed workflow engine
# Upstream prebuilt release distribution from https://github.com/camunda/camunda
# Java distribution tarball; requires a JRE at runtime (provided via extraPkgs).

let
  version = "8.9.11";

  drv = pkgs.stdenv.mkDerivation {
    pname = "camunda-zeebe";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/camunda/camunda/releases/download/${version}/camunda-zeebe-${version}.tar.gz";
      hash = "sha256:07d4qd8vcbxv7gzhhl43r9mjrqdwamyb5bmmpx06xqnfkm8prcs0";
    };

    # Pure-Java distribution (no ELF to patch); autoPatchelfHook is a harmless no-op.
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = "camunda-zeebe-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/camunda-zeebe $out/bin
      cp -r . $out/share/camunda-zeebe/
      for f in camunda broker gateway operate tasklist migrate restore schema; do
        if [ -f "$out/share/camunda-zeebe/bin/$f" ]; then
          chmod +x "$out/share/camunda-zeebe/bin/$f"
          ln -s "$out/share/camunda-zeebe/bin/$f" "$out/bin/$f"
        fi
      done
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "camunda-zeebe";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/camunda" ];
  cmd = [];

  extraPkgs = with pkgs; [
    jdk
    bash
  ];

  labels = {
    "org.opencontainers.image.title" = "camunda-zeebe";
    "org.opencontainers.image.description" = "Camunda 8 (Zeebe) distributed workflow engine";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
