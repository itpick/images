{ buildCLIImage, pkgs, lib, ... }:

# kyverno-cli uses the same package as kyverno, but different binary
buildCLIImage {
  drv = pkgs.kyverno;
  name = "kyverno-cli";
  tag = "v${pkgs.kyverno.version}";
  entrypoint = [ "${pkgs.kyverno}/bin/kyverno-cli" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno CLI";
    "org.opencontainers.image.description" = "Kyverno command-line interface for policy validation";
    "org.opencontainers.image.version" = pkgs.kyverno.version;
    "io.nix-containers.chart" = "kyverno";
  };
}
