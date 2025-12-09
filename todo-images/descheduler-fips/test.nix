{ pkgs, lib, ... }:

# TODO: Add tests for descheduler-fips image
{
  name = "descheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for descheduler-fips"
    exit 1
  '';
}
