# jaeger
# ======
# Distributed tracing all-in-one — Jaeger agent + collector + query in a single binary (dev/testing)
# https://github.com/jaegertracing/jaeger
#
# Build strategy: nix2container.pullImage (re-wrap upstream Docker image)
# -----------------------------------------------------------------------
# Jaeger all-in-one is a Go binary distributed as a Docker image.
# We pull the upstream image and re-wrap it with our standard labels.
#
# sha256 is the NAR hash of the pulled image directory — refresh with:
#   nix build --no-link .#jaeger 2>&1 | grep "got:"

{ nix2container, pkgs, lib, ... }:

let
  version = "latest";

  upstreamImage = nix2container.pullImage {
    imageName   = "jaegertracing/all-in-one";
    imageDigest = "sha256:ab6f1a1f0fb49ea08bcd19f6b84f6081d0d44b364b6de148e1798eb5816bacac";
    sha256      = "sha256-EtdbPm0qyE6ER+3bk2JwHVh38H+xAT3JkW9jt89j+hA=";
  };

in
nix2container.buildImage {
  name      = "jaeger";
  tag       = version;
  fromImage = upstreamImage;

  config = {
    Labels = {
      "org.opencontainers.image.title"       = "Jaeger All-in-One";
      "org.opencontainers.image.description" = "Distributed tracing all-in-one — Jaeger agent + collector + query in a single binary (dev/testing)";
      "org.opencontainers.image.version"     = version;
      "org.opencontainers.image.source"      = "https://github.com/jaegertracing/jaeger";
      "io.nix-containers.build-strategy"     = "nix2container-pullImage";
      "io.nix-containers.upstream-image"     = "docker.io/jaegertracing/all-in-one:latest";
    };
  };
}
