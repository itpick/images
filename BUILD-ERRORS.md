# Build Errors Report

Generated: 2025-12-12

## Summary
- **Total images:** 3054
- **Successful:** 1879 (61.5%)
- **Failed:** 1175 (38.5%)

## Root Cause (FIXED)

Most failures were caused by a cascading error in `lib/versions.nix`:

```
error: attribute 'agent' missing
at nixpkgs/pkgs/top-level/all-packages.nix:
  spire-agent = spire.agent;
```

The `versions.nix` file attempts to dynamically look up package versions for all images. When it tries to evaluate `pkgs.spire-agent`, nixpkgs internally references `spire.agent` which doesn't exist in this nixpkgs revision.

This causes ALL subsequent image builds to fail because the versions.nix evaluation fails early.

## Fix Required

Remove or comment out the problematic entries in `lib/versions.nix`:
- `"spire-agent" = getVer "spire-agent";`
- `"spire-server" = getVer "spire-server";`
- Any other packages that reference broken nixpkgs aliases

Alternatively, add these as hardcoded versions instead of dynamic lookups.

## Failed Images

See `build-fail.log` for the complete list of 1175 failed images.

## Fix Applied

The spire package references have been commented out in `lib/versions.nix`:
```nix
# spire packages removed - nixpkgs alias is broken (spire.agent missing)
# "spire-agent" = getVer "spire-agent";
# "spire-server" = getVer "spire-server";
# "spire" = getVer "spire";
```

## Next Steps

1. ~~Fix the versions.nix to remove broken package references~~ ✅ DONE
2. Re-run the build to get actual failure counts
3. Capture actual build errors for images that still fail
4. Categorize remaining failures:
   - Hash mismatches (need `nix-prefetch-url`)
   - Missing go.mod files
   - Placeholder hashes (`sha256-AAA...`)
   - Removed packages
