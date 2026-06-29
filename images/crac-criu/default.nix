{ mkImage, pkgs, lib, ... }:

# CRaC CRIU - Checkpoint/Restore In Userspace, CRaC (Coordinated Restore at Checkpoint) build
# https://github.com/CRaC/criu

let
  version = "1.5.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "crac-criu";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/CRaC/criu/releases/download/release-${version}/criu-crac-release-${version}.tar.gz";
      hash = "sha256-gXSCswPoX7+apbRBpkpc5V6rwjVJrxa+mOVsSpKKGZs=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "criu-crac-release-${version}";

    installPhase = ''
      runHook preInstall
      install -Dm755 sbin/criu $out/bin/criu
      install -Dm755 sbin/criu-ns $out/bin/criu-ns
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "crac-criu";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/criu" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "crac-criu";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
