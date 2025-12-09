{ pkgs, lib, ... }:

# TODO: Add tests for splunk-otel-collector image
{
  name = "splunk-otel-collector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for splunk-otel-collector"
    exit 1
  '';
}
