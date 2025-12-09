{ pkgs, lib, ... }:

# TODO: Add tests for jitsucom-ingest image
{
  name = "jitsucom-ingest";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jitsucom-ingest"
    exit 1
  '';
}
