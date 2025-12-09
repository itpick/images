{ pkgs, lib, ... }:

# TODO: Add tests for splunk-otel-collector-fips image
{
  name = "splunk-otel-collector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for splunk-otel-collector-fips"
    exit 1
  '';
}
