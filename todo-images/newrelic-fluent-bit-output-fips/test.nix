{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-fluent-bit-output-fips image
{
  name = "newrelic-fluent-bit-output-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-fluent-bit-output-fips"
    exit 1
  '';
}
