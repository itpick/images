# chart-routing.nix
# =================
# Reads chart-image-mapping.nix and emits two JSON views:
#
#   imagesPerChart: { chartName: [nixImage, ...], ... }
#   chartsPerImage: { nixImage: [chartName, ...], ... }
#
# Used by the test-images-charts CI workflow and by local debugging.
{ pkgs ? import <nixpkgs> {} }:

let
  mapping = import ../../chart-image-mapping.nix;

  # Flatten { tier = { entry = { nixImage, usedBy, ... }; }; } into a list
  # of { nixImage, usedBy } pairs.
  flatEntries =
    pkgs.lib.flatten (
      pkgs.lib.mapAttrsToList (_tier: entries:
        pkgs.lib.mapAttrsToList (_name: e: {
          inherit (e) nixImage usedBy;
        }) entries
      ) mapping
    );

  # chartsPerImage: { "<nixImage>": [ "<chart>", ... ] }
  chartsPerImage =
    pkgs.lib.foldl' (acc: e:
      acc // { ${e.nixImage} = pkgs.lib.unique ((acc.${e.nixImage} or []) ++ e.usedBy); }
    ) {} flatEntries;

  # imagesPerChart: invert chartsPerImage
  allCharts = pkgs.lib.unique (pkgs.lib.flatten (pkgs.lib.mapAttrsToList (_: v: v) chartsPerImage));
  imagesPerChart =
    pkgs.lib.listToAttrs (map (chart: {
      name = chart;
      value = pkgs.lib.unique (
        pkgs.lib.flatten (
          pkgs.lib.mapAttrsToList (img: charts:
            if pkgs.lib.elem chart charts then [ img ] else []
          ) chartsPerImage
        )
      );
    }) allCharts);

  routing = {
    inherit chartsPerImage imagesPerChart;
  };
in
  pkgs.writeText "chart-routing.json" (builtins.toJSON routing)
