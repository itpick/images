# twentycrm
# =============
# Twenty — open-source CRM
# https://github.com/twentyhq/twenty
#
# Build strategy: dockerTools.pullImage / nix2container re-wrap
# ---------------------------------------------------------------
# Twenty is a Node.js TypeScript monorepo (nx + pnpm, multiple sub-packages).
# A true buildNpmPackage derivation is infeasible in a single pass, so we
# pull the upstream Docker image and re-wrap it with our standard labels.
# A true source-build is tracked as a followup.

{ nix2container, pkgs, lib, ... }:

let
  version = "2.12.0";

  # Pull upstream image via nix2container (uses skopeo under the hood).
  # sha256 is the NAR hash of the pulled image directory — refresh with:
  #   nix build --no-link .#twentycrm 2>&1 | grep "got:"
  upstreamImage = nix2container.pullImage {
    imageName   = "twentycrm/twenty";
    imageDigest = "sha256:3d79873411fab4fafb9a7cdece9365b005ad225a09938b6ce8af4653c95cffae";
    sha256      = "sha256-Epl8i3zWfBj6vFGwdML/X0t1pRH0V4pH1QBnaP9ASFg=";
  };

in
# Re-wrap the pulled image: inherit all upstream layers, add our labels.
# No extra Nix content is added — this is a pure label-only wrapper.
#
# Tagging note
# ------------
# `tag = "v${version}"` matches upstream `twentycrm/twenty:v<X>.<Y>.<Z>`.
# The publish workflow's tag-resolution chain reads `.imageTag` (since
# nix2container.buildImage does not expose `.config.Labels` as a direct
# attribute), so a published image lands at
# `ghcr.io/nix-containers/images/twentycrm:v${version}` alongside `:latest`.
# Consumers should pin to the version tag, NOT `:latest` — see issue #55.
(nix2container.buildImage {
  name      = "twentycrm";
  tag       = "v${version}";
  fromImage = upstreamImage;

  config = {
    Labels = {
      "org.opencontainers.image.title"       = "Twenty CRM";
      "org.opencontainers.image.description" = "Open-source CRM, re-wrapped from upstream image";
      "org.opencontainers.image.version"     = version;
      "org.opencontainers.image.source"      = "https://github.com/twentyhq/twenty";
      "io.nix-containers.build-strategy"     = "nix2container-pullImage";
      "io.nix-containers.upstream-image"     = "docker.io/twentycrm/twenty:v${version}";
      "io.nix-containers.followup"           = "true-buildNpmPackage-derivation";
    };
  };
}) // {
  # Expose `version` as a passthru attribute so the publish workflow's
  # tag-resolution chain — and any external `nix eval` consumer — can
  # query it directly without rebuilding the image. nix2container's
  # buildImage output otherwise hides version metadata inside the
  # generated JSON, where `nix eval --raw .#twentycrm.<...>` can't reach
  # it. Keeps `imageTag` (= `v${version}`) and this attribute in sync.
  inherit version;
}
