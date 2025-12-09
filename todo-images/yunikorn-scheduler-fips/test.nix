{ pkgs, lib, ... }:

# TODO: Add tests for yunikorn-scheduler-fips image
{
  name = "yunikorn-scheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for yunikorn-scheduler-fips"
    exit 1
  '';
}
