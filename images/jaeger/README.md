# jaeger

Distributed tracing all-in-one — Jaeger agent + collector + query in a single
binary, intended for development and testing. For production deployments use
the individual component images (jaeger-agent, jaeger-collector, jaeger-query)
with a persistent storage backend (Elasticsearch or Cassandra).

## Build strategy

This image uses `nix2container.pullImage` to reuse the upstream Docker image
(`jaegertracing/all-in-one`) and re-wrap it with standard labels.
The `sha256` field is a placeholder — the first `nix build` will fail with the
correct hash; update `default.nix` and re-run.

## Source

- Upstream: https://github.com/jaegertracing/jaeger
- Docker Hub: https://hub.docker.com/r/jaegertracing/all-in-one

## Build

```
nix build .#jaeger
```

## Ports

- `6831/udp` — Jaeger agent (compact thrift)
- `6832/udp` — Jaeger agent (binary thrift)
- `5778/tcp` — agent config server
- `16686/tcp` — query UI
- `4317/tcp` — OTLP gRPC collector
- `4318/tcp` — OTLP HTTP collector
- `14250/tcp` — model.proto gRPC
- `14268/tcp` — HTTP collector
- `9411/tcp` — Zipkin compatible endpoint

## Persistent data

All-in-one uses in-memory storage by default (no persistence). For durable
traces, configure an external storage backend via `SPAN_STORAGE_TYPE`.
