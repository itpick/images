{ pkgs, lib, ... }:

# TODO: Add tests for vc-scheduler-fips image
{
  name = "vc-scheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-scheduler-fips"
    exit 1
  '';
}
