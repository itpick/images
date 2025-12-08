{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.16.2";
  cert-manager-cainjector = buildGoModule {
    pname = "cert-manager-cainjector";
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

    subPackages = [ "cmd/cainjector" ];

    postInstall = ''
      mv $out/bin/cainjector $out/bin/cert-manager-cainjector
    '';

    doCheck = false;

    meta = with lib; {
      description = "cert-manager CA injector for injecting CA bundles";
      homepage = "https://github.com/cert-manager/cert-manager";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = cert-manager-cainjector;
  name = "cert-manager-cainjector";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-cainjector}/bin/cert-manager-cainjector" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager CA Injector";
    "org.opencontainers.image.description" = "CA bundle injector for cert-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
