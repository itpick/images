{ mkImage, pkgs, lib, ... }:

# Dapr scheduler - control plane component of the Dapr distributed runtime
# https://github.com/dapr/dapr
# (-fips variant packages the same upstream scheduler binary)

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dapr-scheduler-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/scheduler_linux_amd64.tar.gz";
      hash = "sha256-L9FVqAauntUBvCfer5ogI0ozKfG4tUA0AXNxpHi19y8=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 scheduler $out/bin/scheduler
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr scheduler control plane component";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "dapr-scheduler-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/scheduler" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-scheduler-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
