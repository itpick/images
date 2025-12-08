{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.16.2";
  cert-manager-controller = buildGoModule {
    pname = "cert-manager-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "cert-manager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/cert-manager/cert-manager/pkg/util.AppVersion=${version}"
      "-X github.com/cert-manager/cert-manager/pkg/util.AppGitCommit=unknown"
    ];

    subPackages = [ "cmd/controller" ];

    postInstall = ''
      mv $out/bin/controller $out/bin/cert-manager-controller
    '';

    doCheck = false;

    meta = with lib; {
      description = "cert-manager controller for automatic TLS certificate management";
      homepage = "https://github.com/cert-manager/cert-manager";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = cert-manager-controller;
  name = "cert-manager-controller";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-controller}/bin/cert-manager-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Controller";
    "org.opencontainers.image.description" = "Automatic TLS certificate management controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
