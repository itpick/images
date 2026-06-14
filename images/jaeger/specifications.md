# Specifications: jaeger

- **Base:** upstream `jaegertracing/all-in-one:latest` (re-wrapped via nix2container.pullImage)
- **Entrypoint:** inherited from upstream
- **User:** inherited from upstream
- **Ports:** 6831/udp (agent compact), 6832/udp (agent binary), 5778/tcp (agent config),
  16686/tcp (query UI), 4317/tcp (OTLP gRPC), 4318/tcp (OTLP HTTP),
  14250/tcp (model.proto gRPC), 14268/tcp (HTTP collector), 9411/tcp (Zipkin)
- **Persistent dirs:** none (in-memory storage by default; external backend optional)
- **Required env:** `SPAN_STORAGE_TYPE` if using persistent storage (e.g. `elasticsearch`)
- **Note:** All-in-one is for dev/testing only; use separate component images in production
