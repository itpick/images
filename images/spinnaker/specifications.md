# Specifications: spinnaker

- **Base:** upstream `us-docker.pkg.dev/spinnaker-community/docker/halyard:1.61.0` (re-wrapped via nix2container.pullImage)
- **Entrypoint:** inherited from upstream
- **User:** inherited from upstream
- **Ports:** 8064/tcp (halyard daemon API)
- **Persistent dirs:** `/home/spinnaker/.hal` (halyard config), `/home/spinnaker/.spinnaker` (generated config)
- **Required env:** see upstream docs; halyard connects to a running Spinnaker deployment
- **Registry note:** Source image is on GAR (`us-docker.pkg.dev`), not Docker Hub; may require image mirroring in air-gapped environments — see README.md
- **Note:** Halyard installer only; Spinnaker proper is 10+ microservices (clouddriver, deck, echo, fiat, front50, gate, igor, kayenta, orca, rosco)
