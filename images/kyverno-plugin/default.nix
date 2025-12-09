# kyverno-plugin
# =============
# Placeholder for kyverno-plugin container image.
# Referenced in BigBang/IronBank deployments.
#
# TODO: Implement this image
# Reference: Check BigBang documentation for source details

{ ... }:


# Chainguard SBOM packages for kyverno-plugin:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.kyverno  # kyverno-1.16 (1.16.1-r0)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)

throw "Image 'kyverno-plugin' is not yet implemented. See default.nix for implementation notes."
