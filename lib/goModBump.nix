{ lib }:

# Bump Go modules past what upstream's go.mod pins, to clear CVEs in vendored
# dependencies before upstream cuts a release (or when upstream is archived).
#
# Merge the result into buildGoModule args, or pass it through overrideAttrs:
#
#   goModBump = import ../../lib/goModBump.nix { inherit lib; };
#   buildGoModule (args // goModBump [ "golang.org/x/net@v0.62.0" ])
#
# How it works: `go get` runs inside the goModules fixed-output derivation
# (the only place with network), and the resulting go.mod/go.sum ride along in
# its output so the main build compiles against exactly what was vendored.
# vendorHash must be non-null and changes whenever `deps` changes. Repos that
# commit a vendor/ tree work too: it is dropped and regenerated.
deps: {
  overrideModAttrs = _final: prev: {
    # Replaces the preBuild inherited from the main derivation, which restores
    # go.mod from $goModules and so cannot run here.
    preBuild = ''
      rm -rf vendor
      go get ${lib.escapeShellArgs deps}
      # go get leaves go.sum without entries for some indirect imports, which
      # `go mod vendor` then rejects. -e: tolerate unrelated test-only gaps.
      go mod tidy -e
    '';
    postInstall = (prev.postInstall or "") + ''
      cp go.mod "$out/.nix-go.mod"
      cp go.sum "$out/.nix-go.sum"
    '';
  };

  preBuild = ''
    cp "$goModules/.nix-go.mod" go.mod
    cp "$goModules/.nix-go.sum" go.sum
  '';
}
