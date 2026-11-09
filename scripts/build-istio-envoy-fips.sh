#!/usr/bin/env bash
# Rebuild the AWS-LC-FIPS Envoy that pkgs/istio-fips fetches.
#
# WHY THIS SCRIPT EXISTS. Nothing publishes a FIPS Envoy that Istio can use.
# Chainguard's envoy-fips is UPSTREAM Envoy, and Istio's data plane needs
# istio/proxy's build: the bootstrap requires
# type.googleapis.com/istio.workload.BootstrapExtension and the binary must
# carry io.istio.http.peer_metadata, io.istio.local_principal and
# io.istio.peer_principal. A vanilla FIPS Envoy rejects Istio's config outright.
# Google's ASM publishes no FIPS variant; Tetrate's is subscription-gated.
#
# The build cannot run inside a nix derivation: it is a ~60 minute Bazel build
# needing network access mid-build and its own clang/cmake/ninja/go toolchain.
# So the binary is built here, attached to a GitHub release, and fetched by hash
# in pkgs/istio-fips. That keeps the IMAGE reproducible from git while the
# binary stays a documented, hash-pinned input.
#
# THE MODULE: AWS-LC 3 Cryptographic Module (static), AWS-LC FIPS 3.1.0,
# NIST CMVP #5314 (FIPS 140-3 L1). Two stages:
#   1. libcrypto.a/libssl.a built EXACTLY per Security Policy section 11.1:
#      Amazon Linux 2023, "Development Tools" + cmake3 + golang,
#      `cmake3 -DFIPS=1 .. && make`, from the unmodified
#      AWS-LC-FIPS-3.1.0.zip (sha256 checked against the policy), then
#      `bssl isfips` must print 1. Envoy's own in-Bazel AWS-LC genrule is NOT
#      used: it compiles with a different compiler/flags than the policy's
#      method, and the Management Manual (7.9.2 fn 5) only allows a user
#      recompile that follows the policy's method without modification.
#   2. istio/proxy at PROXY_SHA with istio-envoy-awslc-fips/istio-proxy-<sha8>-*.patch:
#        WORKSPACE  @aws_lc -> new_local_repository on the stage-1 libraries
#                   + envoy patch 0014 (FIPS_202205 policy on AWS-LC, below)
#        BUILD      drop cryptomb/QAT key providers for AWS-LC (as istio/proxy
#                   already does for OpenSSL; they do key ops outside the module)
#      built with --config=release --config=aws-lc-fips (implies http3=False).
#
# PATCH 0014 (Envoy only, module untouched): AWS-LC lacks
# SSL_CTX_set_compliance_policy and Envoy's compat shim stubs it to fail, so a
# listener with compliance_policies: [FIPS_202205] would be rejected. 0014
# implements that policy with public AWS-LC APIs (TLS>=1.2; TLS1.2
# ECDHE-*-AES-GCM; TLS1.3 AES-GCM only; P-256/P-384; no SHA-1/Ed25519 sigalgs).
# AWS-LC cannot REQUIRE extended master secret, so that part is not emulated.
#
# Requirements: docker, ~60 GB free disk. Defaults to JOBS=6 (several hours);
# raise JOBS only on a host whose system disk is NVMe and not shared with etcd.
#
# THREE THINGS THAT WILL WASTE YOUR TIME IF YOU DO NOT KNOW THEM:
#   1. `build-tools` has NO bazel. The proxy repo needs `build-tools-proxy`.
#   2. `--define boringssl=fips` was REMOVED from Envoy; FIPS builds use
#      `--config=boringssl-fips` / `--config=aws-lc-fips`.
#   3. bazel needs `git config --global --add safe.directory` on a bind mount.
#
# OPERATIONAL ENVIRONMENT: #5314 lists Amazon Linux 2023 only, with no
# vendor-affirmed OEs. Running on another Linux (e.g. GKE COS) is a USER
# affirmation (FIPS 140-3 Management Manual 7.9.2); CMVP makes no statement
# about correct operation on unlisted OEs.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
PATCHDIR="$HERE/istio-envoy-awslc-fips"
# Defaults track istio 1.31.4: PROXY_SHA is istio.deps PROXY_REPO_SHA at that
# tag, IMG is istio/proxy common/scripts/setup_env.sh IMAGE_VERSION at PROXY_SHA.
# To rebuild 1.30.4: PROXY_SHA=ce177c56fe75661f16b654e2f164d4ab02058222
#   ISTIO_TAG=1.30.4 IMG=registry.istio.io/testing/build-tools-proxy:release-1.30-ad8991a47cf3c61799caa5569b9458d95eb612f2
PROXY_SHA="${PROXY_SHA:-defdcd65d0c035b54b324dc6ed4ef258e22bf94d}"
ISTIO_TAG="${ISTIO_TAG:-1.31.4}"
IMG="${IMG:-registry.istio.io/testing/build-tools-proxy:release-1.31-1e91690fdecc6121b740c677fc8049f4f76319c3}"
# istio/proxy patch, one per PROXY_SHA (WORKSPACE drifts between releases).
PROXY_PATCH="${PROXY_PATCH:-$PATCHDIR/istio-proxy-${PROXY_SHA:0:8}-awslc-fips.patch}"
AL2023="${AL2023:-amazonlinux:2023}"
WORK="${WORK:-/tmp/istio-envoy-awslc-fips-build}"
AWSLC_ZIP_URL="https://github.com/aws/aws-lc/archive/refs/tags/AWS-LC-FIPS-3.1.0.zip"
AWSLC_ZIP_SHA256="fe408fa438850786396faf79eba9ea4116c3802e60f3a95865f0dd2adb64c9f1" # SP 11.1

echo "==> istio ${ISTIO_TAG}, proxy ${PROXY_SHA}, AWS-LC FIPS 3.1.0 (CMVP #5314)"
mkdir -p "$WORK/bazel-out" "$WORK/bazel-cache" "$WORK/sp-build" "$WORK/awslc-prebuilt"

# ---- stage 1: the module, per Security Policy 11.1 ----
curl -fsSL -o "$WORK/sp-build/AWS-LC-FIPS-3.1.0.zip" "$AWSLC_ZIP_URL"
echo "$AWSLC_ZIP_SHA256  $WORK/sp-build/AWS-LC-FIPS-3.1.0.zip" | sha256sum -c -
cp "$PATCHDIR/build-aws-lc-per-security-policy.sh" "$WORK/sp-build/"
docker run --rm -v "$WORK/sp-build":/w "$AL2023" /w/build-aws-lc-per-security-policy.sh \
  | tee "$WORK/sp-build/sp-build.log" | grep -E '^ISFIPS='
grep -qx 'ISFIPS=1' "$WORK/sp-build/sp-build.log" \
  || { echo "ERROR: bssl isfips != 1" >&2; exit 1; }
SRC="$WORK/sp-build/aws-lc-AWS-LC-FIPS-3.1.0"
rm -rf "$WORK/awslc-prebuilt"/*
mkdir -p "$WORK/awslc-prebuilt/crypto" "$WORK/awslc-prebuilt/ssl"
cp -a "$SRC/include" "$WORK/awslc-prebuilt/"
cp "$SRC/build/crypto/libcrypto.a" "$WORK/awslc-prebuilt/crypto/"
cp "$SRC/build/ssl/libssl.a" "$WORK/awslc-prebuilt/ssl/"

# ---- stage 2: istio/proxy Envoy ----
if [ ! -d "$WORK/proxy/.git" ]; then
  git clone --filter=blob:none https://github.com/istio/proxy.git "$WORK/proxy"
fi
git -C "$WORK/proxy" fetch --depth 1 origin "$PROXY_SHA"
git -C "$WORK/proxy" checkout -f "$PROXY_SHA"
git -C "$WORK/proxy" clean -fdq
[ -f "$PROXY_PATCH" ] || { echo "ERROR: no istio/proxy patch for ${PROXY_SHA}: $PROXY_PATCH" >&2; exit 1; }
git -C "$WORK/proxy" apply "$PROXY_PATCH"

# Parallelism and priority. JOBS caps Bazel actions AND the container's CPU
# quota; NICE/IONICE wrap bazel inside the container (nice on the host-side
# `docker run` would not reach the build). ionice -c3 only bites on I/O
# schedulers that honour it (bfq); on NVMe with `none` it is a no-op, so the
# real protection is JOBS plus running on a node whose system disk can take it.
JOBS="${JOBS:-6}"
NICE="${NICE:-10}"
IONICE_CLASS="${IONICE_CLASS:-3}"
echo "==> bazel: --jobs=${JOBS}, nice ${NICE}, ionice -c${IONICE_CLASS}"
docker run --rm -u 0:0 \
  --cpus="$JOBS" \
  -e JOBS="$JOBS" -e NICE="$NICE" -e IONICE_CLASS="$IONICE_CLASS" \
  -v "$WORK/proxy":/work \
  -v "$WORK/bazel-out":/bazel-out \
  -v "$WORK/bazel-cache":/root/.cache/bazel \
  -v "$WORK/awslc-prebuilt":/awslc-prebuilt:ro \
  -w /work "$IMG" \
  bash -c '
    git config --global --add safe.directory /work
    # Follow the checked-out tree: 1.30 (ce177c56) pins 7.7.1, 1.31 (defdcd65) 8.7.0.
    export USE_BAZEL_VERSION="$(cat .bazelversion)"
    prio=(nice -n "$NICE")
    command -v ionice >/dev/null && prio+=(ionice -c "$IONICE_CLASS")
    "${prio[@]}" bazel --output_base=/bazel-out build \
      --config=release \
      --config=aws-lc-fips \
      --verbose_failures \
      --jobs="$JOBS" \
      --local_resources=cpu="$JOBS" \
      --disk_cache=/root/.cache/bazel/disk \
      //:envoy
  '

BIN="$WORK/bazel-out/execroot/io_istio_proxy/bazel-out/k8-opt/bin/envoy"
echo "==> verifying the binary reports AWS-LC-FIPS and statically links the module"
docker run --rm -u 0:0 -v "$(dirname "$BIN")":/b:ro "$IMG" /b/envoy --version \
  | grep 'AWS-LC-FIPS' >/dev/null \
  || { echo "ERROR: binary does not report AWS-LC-FIPS" >&2; exit 1; }
# grep >/dev/null, not grep -q: -q exits on the first match, nm/strings then
# die of SIGPIPE and pipefail turns a found symbol into a failure.
nm "$BIN" | grep ' T awslc_version_string$' >/dev/null \
  || { echo "ERROR: awslc_version_string not statically linked" >&2; exit 1; }
strings -a "$BIN" | grep -x 'AWS-LC FIPS 3.1.0' >/dev/null \
  || { echo "ERROR: module version string 'AWS-LC FIPS 3.1.0' missing" >&2; exit 1; }

ASSET="$WORK/istio-envoy-awslc-fips-3.1.0-${PROXY_SHA}.gz"
echo "==> sha256 (uncompressed): $(sha256sum "$BIN" | awk '{print $1}')"
gzip -1 -n -c "$BIN" > "$ASSET"
echo "==> asset: $ASSET"
echo
echo "Next: attach it to a NEW release (never replace an existing asset) and"
echo "update the url/hash in pkgs/istio-fips:"
echo "  gh release create istio-envoy-awslc-fips-${ISTIO_TAG} --repo nix-containers/images \\"
echo "    \"$ASSET\""
echo "  nix hash file --type sha256 --sri \"$ASSET\""
