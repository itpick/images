{ pkgs, lib, ... }:

# TODO: Add tests for aws-otel-collector-fips image
{
  name = "aws-otel-collector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-otel-collector-fips"
    exit 1
  '';
}
