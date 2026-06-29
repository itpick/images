{ mkImage, pkgs, lib, ... }:

# CNI bandwidth plugin (from containernetworking/plugins release bundle)
# https://github.com/containernetworking/plugins

let
  version = "1.9.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cni-plugins-bandwidth";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containernetworking/plugins/releases/download/v${version}/cni-plugins-linux-amd64-v${version}.tgz";
      hash = "sha256-uY90oPhSLwqDhnF4cpwapw8hWPkMRaLKj6eR2xx2swM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 ./bandwidth $out/bin/bandwidth
      runHook postInstall
    '';

    meta = with lib; {
      description = "CNI bandwidth plugin";
      homepage = "https://github.com/containernetworking/plugins";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "cni-plugins-bandwidth";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/bandwidth" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "cni-plugins-bandwidth";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
