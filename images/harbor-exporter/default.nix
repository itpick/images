# harbor-exporter
# =============
# Placeholder for harbor-exporter container image.
# Referenced in BigBang/IronBank deployments.
#
# TODO: Implement this image
# Reference: Check BigBang documentation for source details

{ ... }:


# Chainguard SBOM packages for harbor-exporter:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
# Packages NOT in nixpkgs:
#   bash-binsh (5.3-r3)
#   harbor-2.14-exporter (2.14.1-r1)
#   ld-linux (2.42-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

throw "Image 'harbor-exporter' is not yet implemented. See default.nix for implementation notes."
