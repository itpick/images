# Kind Smoke Test — Known Limitations

The kind smoke test in `.github/workflows/test-images-kind.yml` deploys each
image as a **generic Pod with the image's default entrypoint/cmd and no
overrides**, then waits up to 90s for the pod to reach `Running` (long-lived
servers) or `Succeeded` (one-shot CLIs).

This is a useful baseline but is a *categorical* test: it catches images that
can't load or schedule on Kubernetes at all. It cannot, by design, validate:

- CLI images that need a subcommand to do useful work (running them with no
  args makes them exit non-zero or print usage and exit 1)
- Server images that need a config file mounted before they can start
- Images that ship with a non-root UID that conflicts with kind's default
  security context, requiring an explicit `securityContext` in the Pod spec
- Apps that need a cluster sidecar (CRDs, ServiceAccounts, peer endpoints)

When you see a failure for one of these reasons, the right move is usually
not to "fix" the image — it's working as designed. The right move is to write
a richer test (per-image override or a helm-chart deploy that wires the
required surrounding context).

## Observed at run 2026-06-14 (run 27508522503)

Baseline: 21/39 pass smoke, 18/39 fail.

### Pass (21)

`buildah`, `clickhouse`, `contour`, `dex`, `etcd`, `gitea`, `gitlab-runner`,
`grafana`, `jenkins`, `loki`, `mongodb`, `openbao`, `opentofu`, `prometheus`,
`restic`, `skopeo`, `step-ca`, `syft`, `terraform`, `thanos`, `traefik`.

### Fail (18) — categorized

#### CLI-needs-subcommand (no-op default exits non-zero)

`cosign`, `grype`, `kaniko`, `trivy`.

These should pass if the kind Pod spec sets `command: ["<binary>", "--help"]`
or similar harmless invocation.

#### Server-needs-config (default config refuses to start)

`caddy`, `envoy`, `fluent-bit`, `fluentd`, `haproxy`, `opentelemetry-collector`.

These need a minimal config mounted via ConfigMap before they can reach
`Running`. Without one, the default entrypoint exits with a config-error
exit code on startup.

#### Container-create-error (UID / FS permission)

`caddy` (also above), suspected others. Pod phase = `Pending`, reason =
`CreateContainerError`. Likely a securityContext mismatch.

#### Cluster-context-required

`argo-events`, `argo-rollouts`, `buildkit`, `coredns`, `mariadb`, `mimir`,
`tempo`, `valkey`.

These either crash on first start without DB initialisation, CRDs, peer
sidecars, or service endpoints. They're not failures of the image — they're
failures of running them in isolation.

## Next steps (when someone wants to address this)

1. Build a per-image override registry (e.g. `tests/kind-tests/overrides.yaml`)
   that the kind workflow consults for `command`, `securityContext`, `env`,
   `volumeMounts`, etc.
2. For images mapped in `chart-image-mapping.nix`, wire a chart-based test
   that helm-installs the chart with the image override and validates pod
   Ready. The `tests/kind-tests/` framework already has the chart category
   layout for this; it just needs the CI wiring.
3. Keep the generic-Pod smoke as the first-line baseline.
