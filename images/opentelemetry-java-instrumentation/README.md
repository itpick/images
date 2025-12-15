# opentelemetry-java-instrumentation

OpenTelemetry auto-instrumentation and instrumentation libraries for Java

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentelemetry-java-instrumentation

# Load into Docker
nix build .#load-opentelemetry-java-instrumentation-to-docker && ./result/bin/load-opentelemetry-java-instrumentation-to-docker
```
