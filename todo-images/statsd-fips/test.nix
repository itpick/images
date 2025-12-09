{ pkgs, lib, ... }:

# TODO: Add tests for statsd-fips image
{
  name = "statsd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for statsd-fips"
    exit 1
  '';
}
