{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# external-dns-nixchart
# =====================
# external-dns for consumption by the charts/external-dns chart.

let
  version = "0.21.0";
  externalDns = buildGoModule {
    pname = "external-dns-nixchart";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "external-dns";
      rev = "v${version}";
      hash = "sha256-oqEMIfq7wh3tPjO6ZZ9gwgEE6TwSWaP3GiUwhybo2B4=";
    };
    vendorHash = "sha256-3q/8CODlIDVNdl1EhyFM6c3+IQyO9vtDl8uhXZXPNEI=";
    env.CGO_ENABLED = 0;
    subPackages = [ "." ];
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };
in mkImage {
  drv = externalDns;
  name = "external-dns-nixchart";
  tag = "v${version}";
  entrypoint = [ "${externalDns}/bin/external-dns" ];
  cmd = [];
  user = "1001:0";
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "external-dns-nixchart";
    "org.opencontainers.image.description" = "external-dns for the nix-containers charts/external-dns chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "external-dns";
  };
}
