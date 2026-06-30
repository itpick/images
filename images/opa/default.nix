{ mkImage, pkgs, lib, ... }:

# Open Policy Agent - General-purpose policy engine
# https://www.openpolicyagent.org/

mkImage {
  drv = pkgs.open-policy-agent;
  name = "opa";
  tag = "v${pkgs.open-policy-agent.version}";
  entrypoint = [ "${pkgs.open-policy-agent}/bin/opa" ];
  # Was `version` (a one-shot, so the kind-test pod CrashLoops). Run the policy
  # engine's REST API: `run --server`. OPA needs no config file, datastore or
  # writable dir to start (in-memory store; bundles load from read-only paths).
  # IMPORTANT: in OPA v1 (this image is 1.x) `--addr` defaults to LOCALHOST
  # only, so the kind-test probe couldn't reach it — bind 0.0.0.0:8181
  # explicitly. Operators load policies via -b/--bundle or the REST API.
  cmd = [ "run" "--server" "--addr" "0.0.0.0:8181" ];

  labels = {
    "org.opencontainers.image.title" = "Open Policy Agent";
    "org.opencontainers.image.description" = "General-purpose policy engine for unified policy enforcement";
    "org.opencontainers.image.version" = pkgs.open-policy-agent.version;
  };
}
