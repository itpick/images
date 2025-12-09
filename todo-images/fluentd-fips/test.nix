{ pkgs, lib, ... }:

# TODO: Add tests for fluentd-fips image
{
  name = "fluentd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluentd-fips"
    exit 1
  '';
}
