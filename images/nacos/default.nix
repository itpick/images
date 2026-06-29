{ mkImage, pkgs, lib, ... }:

# Nacos - dynamic service discovery, configuration and service management
# https://github.com/alibaba/nacos
# Packaged from the upstream prebuilt server release tarball (Java application).

let
  version = "3.2.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "nacos";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/alibaba/nacos/releases/download/${version}/nacos-server-${version}.tar.gz";
      hash = "sha256-+ue8ZBQp3WYAhP8kImvckq6aD0DicT9G9iheW9nQJOs=";
    };

    # No ELF binaries in the distribution (pure-Java); autoPatchelfHook is a no-op.
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = "nacos";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/nacos
      cp -r . $out/nacos/
      chmod +x $out/nacos/bin/*.sh
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dynamic service discovery, configuration and service management";
      homepage = "https://github.com/alibaba/nacos";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "nacos";
  tag = "v${version}";
  buildType = "binary";

  entrypoint = [ "${pkgs.bash}/bin/bash" "${drv}/nacos/bin/startup.sh" "-m" "standalone" ];
  cmd = [];

  env = {
    JAVA_HOME = "${pkgs.jre}";
  };

  extraPkgs = [ pkgs.jre pkgs.bash ];

  labels = {
    "org.opencontainers.image.title" = "nacos";
    "org.opencontainers.image.description" = "Nacos service discovery and configuration server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
