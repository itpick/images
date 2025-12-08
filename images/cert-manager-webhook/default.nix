{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.16.2";
  cert-manager-webhook = buildGoModule {
    pname = "cert-manager-webhook";
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

    subPackages = [ "cmd/webhook" ];

    postInstall = ''
      mv $out/bin/webhook $out/bin/cert-manager-webhook
    '';

    doCheck = false;

    meta = with lib; {
      description = "cert-manager webhook for validating and mutating resources";
      homepage = "https://github.com/cert-manager/cert-manager";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = cert-manager-webhook;
  name = "cert-manager-webhook";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-webhook}/bin/cert-manager-webhook" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Webhook";
    "org.opencontainers.image.description" = "Validating and mutating webhook for cert-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
