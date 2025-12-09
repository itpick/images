# trivy-adapter
# =============
# Placeholder for trivy-adapter container image.
# Referenced in BigBang/IronBank deployments.
#
# TODO: Implement this image
# Reference: Check BigBang documentation for source details

{ ... }:


# Chainguard SBOM packages for trivy-adapter:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.trivy  # trivy (0.68.1-r0)
# Packages NOT in nixpkgs:
#   harbor-scanner-trivy (0.34.1-r1)
#   ld-linux (2.42-r4)

throw "Image 'trivy-adapter' is not yet implemented. See default.nix for implementation notes."
