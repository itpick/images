# cfssl-self-sign
# =============
# Placeholder for cfssl-self-sign container image.
# Referenced in BigBang/IronBank deployments.
#
# TODO: Implement this image
# Reference: Check BigBang documentation for source details

{ ... }:


# Chainguard SBOM packages for cfssl-self-sign:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cfssl  # cfssl (1.6.5-r25)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
# Packages NOT in nixpkgs:
#   cfssl-json (1.6.5-r25)
#   gitlab-cfssl-self-sign-scripts-18.6 (18.6.1-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

throw "Image 'cfssl-self-sign' is not yet implemented. See default.nix for implementation notes."
