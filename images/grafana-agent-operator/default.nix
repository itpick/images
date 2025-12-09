# grafana-agent-operator
# =============
# Placeholder for grafana-agent-operator container image.
# This image is referenced in Helm charts but not yet implemented.
#
# TODO: Implement this image
# Reference: Check chart-images.json for source image details
#
# Example patterns to follow:
#   - Go binary: See images/external-dns/default.nix
#   - nixpkgs package: See images/kubectl/default.nix
#   - Java app: See images/jdk/default.nix

{ ... }:


# Chainguard SBOM packages for grafana-agent-operator:
# Packages NOT in nixpkgs:
#   grafana-agent-operator (0.44.6-r1)

throw "Image 'grafana-agent-operator' is not yet implemented. See default.nix for implementation notes."
