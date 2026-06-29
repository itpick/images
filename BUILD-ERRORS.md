# Build Errors Report

Generated: 2025-12-13

## Summary (Initial Run)
- **Total images:** 3054
- **Successful:** 1879 (61.5%)
- **Failed:** 1175 (38.5%)

## Fixes Applied

### 1. Hash Format Issues
- `actions-runner`: Converted hashes to SRI format, added `lttng-ust` dependency
- `actions-runner-controller`: Fixed placeholder vendorHash
- `addon-resizer` / `addon-resizer-fips`: Fixed hash + added `modRoot` for go.mod location
- `argocd`: Fixed src hash
- `calico-node`: Fixed src hash
- `atlantis-fips`: Fixed src hash
- `age-fips`: Fixed src hash

### 2. Missing Arguments
- 12 `argo-workflow-*` images: Changed `localPkgs` to `pkgs` (overlay provides packages)

### 3. versions.nix Errors (FIXED)
Commented out broken spire package references in `lib/versions.nix`.

## Common Error Categories

### Category A: Placeholder Hashes (442 remaining of 781 original)
**Pattern:** `sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=`
**Fix:** Run `./fix-hashes.sh <image-name>` or build and extract correct hash from error.

**Fixed batches (339 images):**
- 21 calico images: `sha256-bgcY/unCLAtPOeEwRJGl8u1dHYdO3tSzMTg47DHOsJM=`
- 26 cilium images: `sha256-bSXOa8txx4AMpv0IWJ0Fy/4loAG3rBYPsGLsaxqPkSo=`
- 33 tekton images: `sha256-3nNACkp/YPeaSiMStg5aMrCKdWSaMg6XDbft/k3HANc=`
- 28 cluster-api images: `sha256-ENbNgstu+YsNESJ2RsJri3B4zO8UI3Dt60/8AFgsxn8=`
- 38 kube-* images: `sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=`
- 50 kubernetes-* images: `sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=`
- 37 jaeger images: `sha256-DQa/BlMC9RECwLVAZ0kN2O5w1ppJbg5NuDhQ/zXXGuc=`
- 46 knative images: `sha256-cLr2T9FGLGistXpMbo2Nyjw9soJ7DXcNFLw5BaAYiEc=`
- 25 kyverno images: `sha256-frLuq91CWjyNSj5HFvYIsyR6NFvZqXLil3YQL5Tli6o=`
- 15 sigstore images: `sha256-+0R/srRJaOY4dOn4sDcIbaquoyxW/JbvRXkpCFDZNWk=`
- 4 prometheus-operator images: `sha256-MgeisPFjNIIAU65MY0p2yS+3Gdfvorv1Jun139otOpc=`
- 4 neuvector images: `sha256-I+U034mud+8AgSBsovXcNMEy7f6eTsJQWw+9wdQmkuc=`
- 4 harbor images: `sha256-j0Eps47o8OxWaWzvutVIvzj+hX9jmB9qRrPKYNIXfRs=`
- 2 vault-k8s images: `sha256-SceGJCkO2fss7Xd3f9ufOznLH0WvINy26aih5YEDvZY=`
- Plus various individual fixes (alertmanager, authservice, aws-*, etc.)

**Remaining groups:**
- 127 crossplane images (many different repos)
- 46 prometheus images (various repos)
- 43 kubeflow images (version mismatch)
- 41 nri images (version not found)
- 26 flux images (version mismatch)

### Category B: Hash Format
**Pattern:** `hash 'xxx' does not include a type`
**Fix:** Convert to SRI format: `sha256-BASE64=`

### Category C: Package Removed from nixpkgs
**Pattern:** `error: xxx has been removed`
**Examples:** arangodb, some python packages
**Fix:** Build from source or use alternative package

### Category D: Missing go.mod
**Pattern:** `go: go.mod file not found`
**Fix:** Add `modRoot = "subdir";` or `sourceRoot = "source/subdir";`

### Category E: Missing Dependencies
**Pattern:** `auto-patchelf could not satisfy dependency`
**Fix:** Add missing library to `buildInputs`

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

See `data-gathering/build-fail.log` for the complete list of 1175 failed images.

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
