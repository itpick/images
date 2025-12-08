{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.23.1";
  node-local-dns = buildGoModule {
    pname = "node-local-dns";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "dns";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/node-cache" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kubernetes/dns/pkg/version.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NodeLocal DNS cache";
      homepage = "https://github.com/kubernetes/dns";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = node-local-dns;
  name = "node-local-dns";
  tag = "${version}";
  entrypoint = [ "${node-local-dns}/bin/node-cache" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "NodeLocal DNS Cache";
    "org.opencontainers.image.description" = "Node-level DNS caching daemon";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "node-local-dns";
  };
}
