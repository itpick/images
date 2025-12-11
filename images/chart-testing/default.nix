{ mkImage, pkgs, lib, ... }:

# chart-testing - Tool for testing Helm charts
# https://github.com/helm/chart-testing

mkImage {
  drv = pkgs.chart-testing;
  name = "chart-testing";
  tag = "v${pkgs.chart-testing.version}";
  entrypoint = [ "${pkgs.chart-testing}/bin/ct" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert git helm kubectl ];

  labels = {
    "org.opencontainers.image.title" = "chart-testing";
    "org.opencontainers.image.description" = "Tool for testing Helm charts";
    "org.opencontainers.image.version" = pkgs.chart-testing.version;
  };
}
